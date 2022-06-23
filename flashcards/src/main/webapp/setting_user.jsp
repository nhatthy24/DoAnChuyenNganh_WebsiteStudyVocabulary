<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 5/18/2022
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./css/setting_profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="theme-default">
<div class="site">
<%--    <jsp:include page="header.jsp"></jsp:include>--%>
    <div class="DashboardLayout">
        <div class="DashboardLayout-container">
            <div class="DashboardLayout-main">
                <main
                        class="page"
                        id="page"
                        role="main"
                        itemscope=""
                        itemprop="mainContentOfPage"
                >
                    <div>

                        <div id="ManageAutoRenewSubscriptionNotificationTarget"></div>
                        <div id="SettingsEdgyDataTarget"></div>
                        <div
                                class="UIDiv SettingsBox profile setting"
                                id="profile-setting"
                        >
                            <div class="SettingsBox-title">
                                <div class="SettingsBox-illustration">
                      <span
                              class="UserAvatar"
                              id="image-1"
                              style="height: 70px; width: 70px"
                      ><img
                              alt="Ảnh hồ sơ mặc định"
                              referrerpolicy="no-referrer"
                              src=" ${user.avatar}"
                              height="70"
                              width="70"

                      /></span>
                                </div>
                                <div class="SettingsBox-heading">
                                    <h4 class="UIHeading UIHeading--four">Ảnh hồ sơ</h4>
                                </div>
                            </div>
                            <div class="SettingsBox-box">
                                <div class="add-image">
                                    <h2>Thay đổi ảnh hồ sơ của bạn</h2>
                                    <div id="animalGallery">
                                        <a
                                                class="animal" href="settinguser?type=avatar&avatarupdate=./img/boat.jpg"
                                        ><span
                                                class="UserAvatar"
                                                id="image-1.1"
                                                style="height: 46px; width: 46px"
                                        ><img
                                                alt="Ảnh hồ sơ mặc định"
                                                referrerpolicy="no-referrer"
                                                src="./img/boat.jpg"
                                                height="46"
                                                width="46"
                                        /></span></a
                                        ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/blueAndRedFish.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-2"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá màu đỏ và xanh"
                                            referrerpolicy="no-referrer"
                                            src="./img/blueAndRedFish.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/profileAvatarDefault.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-3"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Thuyền"
                                            referrerpolicy="no-referrer"
                                            src="./img/profileAvatarDefault.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/buffalo.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-4"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Con trâu"
                                            referrerpolicy="no-referrer"
                                            src="./img/buffalo.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/butterfly.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-5"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Bướm xanh và trắng"
                                            referrerpolicy="no-referrer"
                                            src="./img/butterfly.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/caNoc.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-6"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá nóc"
                                            referrerpolicy="no-referrer"
                                            src="./img/caNoc.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/catStandUp.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-7"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Mèo con đang đứng"
                                            referrerpolicy="no-referrer"
                                            src="./img/catStandUp.jpg"

                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/chimChaoMao.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-8"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Chim chào mào"
                                            referrerpolicy="no-referrer"
                                            src="./img/chimChaoMao.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/deer.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-9"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="gấu con bắc cực"
                                            referrerpolicy="no-referrer"
                                            src="./img/deer.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/dog.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-10"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Chó con"
                                            referrerpolicy="no-referrer"
                                            src="./img/dog.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/download.png"
                                    ><span
                                            class="UserAvatar"
                                            id="image-11"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cú"
                                            referrerpolicy="no-referrer"
                                            src="./img/download.png"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/duck.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-12"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Vịt con"
                                            referrerpolicy="no-referrer"
                                            src="./img/duck.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/duckDuck.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-13"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Vịt lớn"
                                            referrerpolicy="no-referrer"
                                            src="./img/duckDuck.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/eagle.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-14"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Đại bàng"
                                            referrerpolicy="no-referrer"
                                            src="./img/eagle.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/fishOn.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-16"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="cá chọi xiêm"
                                            referrerpolicy="no-referrer"
                                            src="./img/fishOn.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/Flamingo.jpeg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-17"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Hồng hạc"
                                            referrerpolicy="no-referrer"
                                            src="./img/Flamingo.jpeg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/foxAndTree.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-18"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cáo và cây"
                                            referrerpolicy="no-referrer"
                                            src="./img/foxAndTree.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/frog.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-19"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Ếch"
                                            referrerpolicy="no-referrer"
                                            src="./img/frog.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/gettyimages-585784370-170667a.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-20"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá nóc xanh"
                                            referrerpolicy="no-referrer"
                                            src="./img/gettyimages-585784370-170667a.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/giraffe.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-21"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Hươu cao cổ"
                                            referrerpolicy="no-referrer"
                                            src="./img/giraffe.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/goldenFish.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-22"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá vàng"
                                            referrerpolicy="no-referrer"
                                            src="./img/goldenFish.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/lion.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-23"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Sư tử"
                                            referrerpolicy="no-referrer"
                                            src="./img/lion.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/main.png"
                                    ><span
                                            class="UserAvatar"
                                            id="image-24"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cô bé"
                                            referrerpolicy="no-referrer"
                                            src="./img/main.png"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=../img/monkey.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-25"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Khỉ"
                                            referrerpolicy="no-referrer"
                                            src="./img/monkey.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/Nhim.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-26"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Nhím con"
                                            referrerpolicy="no-referrer"
                                            src="./img/Nhim.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/Octobus.png"
                                    ><span
                                            class="UserAvatar"
                                            id="image-27"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Bạch tuộc vàng"
                                            referrerpolicy="no-referrer"
                                            src="./img/Octobus.png"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/octopus-145868_1280.png"
                                    ><span
                                            class="UserAvatar"
                                            id="image-28"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Bạch tuộc xanh"
                                            referrerpolicy="no-referrer"
                                            src="./img/octopus-145868_1280.png"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/orangeCat.jpeg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-29"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Mèo cam"
                                            referrerpolicy="no-referrer"
                                            src="./img/orangeCat.jpeg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/orangeFish.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-30"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá cam"
                                            referrerpolicy="no-referrer"
                                            src="./img/orangeFish.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/panda.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-31"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Gấu trúc"
                                            referrerpolicy="no-referrer"
                                            src="./img/panda.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/parrot.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-32"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Vẹt"
                                            referrerpolicy="no-referrer"
                                            src="./img/parrot.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/penguin.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-33"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Chim cánh cụt"
                                            referrerpolicy="no-referrer"
                                            src="./img/penguin.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/pig.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-34"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Heo con"
                                            referrerpolicy="no-referrer"
                                            src="./img/pig.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/raccon.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-35"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Gấu mèo"
                                            referrerpolicy="no-referrer"
                                            src="./img/raccon.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/racconHi.jpeg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-36"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Gấu mèo xin chào"
                                            referrerpolicy="no-referrer"
                                            src="./img/racconHi.jpeg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/redFish.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-37"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá đỏ"
                                            referrerpolicy="no-referrer"
                                            src="./img/redFish.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/rhino.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-38"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Tê giác"
                                            referrerpolicy="no-referrer"
                                            src="./img/rhino.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/saoBien.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-39"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Sao biển"
                                            referrerpolicy="no-referrer"
                                            src="./img/saoBien.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/shark.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-40"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá mập"
                                            referrerpolicy="no-referrer"
                                            src="./img/shark.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/sitDog.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-41"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Chó con ngồi"
                                            referrerpolicy="no-referrer"
                                            src="./img/sitDog.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/smallCat.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-42"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Mèo con"
                                            referrerpolicy="no-referrer"
                                            src="./img/smallCat.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/smileDog.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-43"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Chó con cười"
                                            referrerpolicy="no-referrer"
                                            src="./img/smileDog.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/Soi.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-44"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Sói"
                                            referrerpolicy="no-referrer"
                                            src="./img/Soi.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/startFish.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-45"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cá sao"
                                            referrerpolicy="no-referrer"
                                            src="./img/startFish.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/tigerGray.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-46"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Hổ xám"
                                            referrerpolicy="no-referrer"
                                            src="./img/tigerGray.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/tigerSmall.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-47"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Hổ con"
                                            referrerpolicy="no-referrer"
                                            src="./img/tigerSmall.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/turtle.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-48"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Rùa con"
                                            referrerpolicy="no-referrer"
                                            src="./img/turtle.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/Vet.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-49"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Vẹt"
                                            referrerpolicy="no-referrer"
                                            src="./img/Vet.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/whiteBear.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-50"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Gấu trắng"
                                            referrerpolicy="no-referrer"
                                            src="./img/whiteBear.jpg"
                                            height="46"
                                            width="46"
                                    /></span></a
                                    ><a class="animal" href="settinguser?type=avatar&avatarupdate=./img/whiteFox.jpg"
                                    ><span
                                            class="UserAvatar"
                                            id="image-51"
                                            style="height: 46px; width: 46px"
                                    ><img
                                            alt="Cáo trắng"
                                            referrerpolicy="no-referrer"
                                            src="./img/whiteFox.jpg"
                                            height="46"
                                            width="46"
                                    /></span
                                    ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="UIDiv SettingsBox" id="account-type-setting">
                            <div class="SettingsBox-title">
                                <div class="SettingsBox-illustration">
                                    <div class="UIIcon UIIcon--book"><i class="fa fa-book" aria-hidden="true" style="font-size: 3em;"></i></div>
                                </div>
                                <div class="SettingsBox-heading">
                                    <h4 class="UIHeading UIHeading--four">Loại tài khoản</h4>
                                </div>
                            </div>
                            <div class="SettingsBox-box">
                                <form action="" method="get">
                                    <h4 class="UIHeading UIHeading--four">
                                        Tài khoản Giáo viên hoặc Học sinh
                                    </h4>
                                    <div class="UIFieldset">
                                        <div class="UIFieldset-legend">
                                            Chọn loại tài khoản của bạn:
                                        </div>
                                        <c:if test = "${role_id==0}">
                                        <div class="UIFieldset-fields">
                                            <label class="UIRadio"
                                            ><input
                                                    class="UIRadio-input"
                                                    name="roleidupdate"
                                                    type="radio"
                                                    value="1"
                                            /><span class="UIRadio-fauxInput"></span
                                            ><span class="UIRadio-label">Giáo viên</span></label
                                            ><label class="UIRadio"
                                        ><input
                                                checked=""
                                                class="UIRadio-input"
                                                name="roleidupdate"
                                                type="radio"
                                                value="0"
                                        /><span class="UIRadio-fauxInput"></span
                                        ><span class="UIRadio-label">Học sinh</span></label
                                        >
                                        </div>
                                        </c:if>
                                        <c:if test = "${role_id==1}">
                                            <div class="UIFieldset-fields">
                                                <label class="UIRadio"
                                                ><input
                                                        checked=""
                                                        class="UIRadio-input"
                                                        name="roleidupdate"
                                                        type="radio"
                                                        value="1"
                                                /><span class="UIRadio-fauxInput"></span
                                                ><span class="UIRadio-label">Giáo viên</span></label
                                                ><label class="UIRadio"
                                            ><input
                                                    class="UIRadio-input"
                                                    name="roleidupdate"
                                                    type="radio"
                                                    value="0"
                                            /><span class="UIRadio-fauxInput"></span
                                            ><span class="UIRadio-label">Học sinh</span></label
                                            >
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="UIDiv">
                                        <button class="UIButton" type="submit">
                                            <span class="UIButton-wrapper">Lưu</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="UIDiv SettingsBox" id="email-change-setting">
                            <div class="SettingsBox-title">
                                <div class="SettingsBox-illustration">
                                    <div class="UIIcon UIIcon--mail">
                                        <i class="fa fa-envelope-o" aria-hidden="true" style="font-size: 3em;"></i>
                                    </div>
                                </div>
                                <div class="SettingsBox-heading">
                                    <h4 class="UIHeading UIHeading--four">
                                        Đổi email của bạn
                                    </h4>
                                </div>
                            </div>
                            <div class="SettingsBox-box">
                                <h4 class="UIHeading UIHeading--four">
                                    Cập nhật địa chỉ email của bạn
                                </h4>
                                <p class="UIParagraph">
                                    Địa chỉ email hiện tại của bạn là ${user.email}
                                </p>
                                <hr class="UIHorizontalRule" />
                                <div class="UIDiv">
                                    <form action="" method="get">
                                        <label class="UIInput"
                                        ><span class="UIInput-content"
                                        ><input
                                                required
                                                class="UIInput-input"
                                                name="emailupdate"
                                                type="email"
                                                value="" /><span
                                                class="UIInput-border"
                                        ></span></span
                                        ><span class="UIInput-label">Email mới</span></label
                                        >
                                        <div class="UIDiv">
                                            <button class="UIButton" type="submit">
                                                <span class="UIButton-wrapper">Gửi</span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="UIDiv SettingsBox" id="username-change-setting">
                            <div class="SettingsBox-title">
                                <div class="SettingsBox-illustration">
                                    <div class="UIIcon UIIcon--profile">
                                        <i class="fa fa-user" aria-hidden="true" style="font-size: 3em;"></i>
                                    </div>
                                </div>
                                <div class="SettingsBox-heading">
                                    <h4 class="UIHeading UIHeading--four">
                                        Đổi tên người dùng
                                    </h4>
                                </div>
                            </div>
                            <div class="SettingsBox-box">
                                <h4 class="UIHeading UIHeading--four">
                                    Cập nhật tên người dùng của bạn
                                </h4>
                                <p class="UIParagraph">
                                    Tên người dùng hiện tại của bạn là ${user.username}
                                </p>
                                <hr class="UIHorizontalRule" />
                                <div class="UIDiv">
                                    <form action="settinguser"  method="get">
                                        <label class="UIInput"
                                        ><span class="UIInput-content"
                                        ><input
                                                required
                                                class="UIInput-input"
                                                id="usernameupdate"
                                                name="usernameupdate"
                                                type="text"
                                                value="" /><span
                                                class="UIInput-border"
                                        ></span></span
                                        ><span class="UIInput-label">Tên người dùng mới</span></label
                                        ><label class="UIInput"
                                    >
                                        <div class="UIDiv">
                                            <button class="UIButton" type="submit">
                                                <span class="UIButton-wrapper">Gửi</span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="UIDiv SettingsBox" id="account-delete-setting">
                            <div class="SettingsBox-title">
                                <div class="SettingsBox-illustration">
                                    <div class="UIIcon UIIcon--x" style="font-size: 3em;">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="SettingsBox-heading">
                                    <h4 class="UIHeading UIHeading--four">Xóa tài khoản</h4>
                                </div>
                            </div>
                            <div class="SettingsBox-box">
                                <h4 class="UIHeading UIHeading--four">
                                    Xóa vĩnh viễn ${user.username}
                                </h4>
                                <p class="UIParagraph">
                                    Hãy cẩn thận - nút này sẽ xóa toàn bộ dữ liệu và không thể
                                    hoàn tác.
                                </p>
                                <div class="UIDiv">
                                    <a
                                            href="settinguser?type=delete"
                                            class="UIButton UIButton--alert"
                                            role="button"
                                    ><span class="UIButton-wrapper">Xóa tài khoản</span></a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
<script src="./js/header.js"></script>
</body>
</html>
