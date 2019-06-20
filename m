Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1376A4CA44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 11:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfFTJHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 05:07:47 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:49690 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725875AbfFTJHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 05:07:47 -0400
Received: from [85.158.142.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id B9/B7-29256-FDC4B0D5; Thu, 20 Jun 2019 09:07:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSb0xTZxTG+/b+6aVwyaXV8FqFLM2GBmht1cz
  iZsZMHHWyaPy0kRG5hSu3oRRoS8Q5CTOiDCzp5jJDEQsLyoagjMUMNhjYjAW7YGvHGKEkFChC
  YYgT0GBQ1sutjn37ved5nveckxwCkQzjMoIpsTAmI22Q42KU3SlOUYylR2aqqlqkmqU6F6p5P
  FQFNGPLfUDzx09XcM3t4EOhptvpAJrqe2mpIu3XvbUi7cJwuUhbW1GDaUeHunDtg4ZbqHaxPf
  4onoHpjbqCkiyM7ZrfU+gnS6wVz4VloC+yEogJlOpH4NMJG8Y9JJRNCP2dT8KPMQCHamZFlSC
  CwCk1vPr3AuB4E3UIBoPd63WEakLg7fMsx1IqFXqu+nHecxCWPe8S8ayE/a1tKMco9QY8Ozq4
  ziSVCX+7v7LOgIqDS5/dQPg/Y+FIwCHkGFIUbOxyIzxvhsHJFxjvPw4v9MyL+HoyHPgrAHiWw
  +vDdoznOOh1VIXqRIg/gKt3X+f2gtQIgO4nVpz3JELfnD/cywCn79wJ/5kAfxxyh+vb4J+Xuj
  E+PIjBRnf5elhCZcNHdQPhQDxsto6jvMmDwPagJ7xNMqz/+THOcxK83jCH8NvHwLs1AdQGdtg
  3LG3fELFviNg3ROoB2gxSdCZ9LmvJp/UGhVqlUqjVuxVqxa5dKUr6EwWtZIoV2YzRYqJDqpI+
  aVaaT+VnG3KURsbSDkJHllMEpjpAZd+c0gm2EEL5ZrJ3Z2SmJFpXkHOKpc3scVOxgTE7wTaCk
  ENyb+gaJTEmJpcpOaE3hE71pQyJKPkmUsbJpLmQzjfrc3nJBRSELVj3DSJBjQVGRhZLNh4OmS
  jOxBYbX33x8uC9IE4mJYFAIJBEFTKmfL3l//osiCWAXEoe41pF6Y2WV51mQ0MIQ0PU14q5ISz
  0f5KsTGio0SUHf3nQl/0UObN4gT1T1KNaPP3Ftx/PTCUl7rjYFF3dufROREeWdM15KOAZPHLy
  5v7f82LEqvHdoz+8LZhi3w3uHVEnvHXj0VaVXhdRqntWV+SVpd30tV3a4k93nF8bka4d+NDzz
  xGk9LvAjDZr2acra3r/S+fl0nOuhel9q9vT9/uKv/cuH/aedsCjr5EVnV8NfD754rLUHaO2pR
  6L3Xp/0j/+3pttgpm0vF5vRu+K/VpEfw/tO9uSt1oe72LJe0sPWzModbOvoVUgt2YMe6pbDWz
  chOvirekDE0kstW9P4FrHMnoiryGrrUXbYZu3ygLbD2o+PRf9EfbrSgL9TI6aWVqdiJjM9L/8
  e8bkawQAAA==
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-13.tower-229.messagelabs.com!1561021662!576597!1
X-Originating-IP: [104.47.10.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5484 invoked from network); 20 Jun 2019 09:07:43 -0000
Received: from mail-db5eur03lp2057.outbound.protection.outlook.com (HELO EUR03-DB5-obe.outbound.protection.outlook.com) (104.47.10.57)
  by server-13.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Jun 2019 09:07:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pnp73Na7VRWy4OnceF7TtgkRt7aad6kDc8BHYa/wJAQ=;
 b=dRV5zVu9IGBW4WYeYZSY3dMaXZAgBKBrNZYKxQmVcuPJ5n1KXAOW7H79ORSGNtHRa2GisTwTK9BxtvUaFFO5knZMGmp4MXIXIxyiQMuse3fwCHDpqzIXH2zyfuedrinKhT3sTTnv0coMgeXkA8yRAEh4JE00682N8Q2e3cURDgA=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2710.EURPRD10.PROD.OUTLOOK.COM (20.179.1.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 20 Jun 2019 09:07:41 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 09:07:41 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Topic: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Index: AdUnR0YGXCrBBqYTTZCmGFZ4naROJQ==
Date:   Thu, 20 Jun 2019 09:07:40 +0000
Message-ID: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2277e828-a145-4db6-322f-08d6f55ebfa4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM6PR10MB2710;
x-ms-traffictypediagnostic: AM6PR10MB2710:
x-microsoft-antispam-prvs: <AM6PR10MB27100B44D9766ECDA2CD303BF5E40@AM6PR10MB2710.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(107886003)(6246003)(229853002)(316002)(54906003)(4326008)(99286004)(7696005)(3846002)(6116002)(9686003)(6436002)(2906002)(25786009)(55016002)(256004)(14444005)(53936002)(102836004)(476003)(305945005)(6506007)(74316002)(7736002)(186003)(5660300002)(26005)(52536014)(68736007)(86362001)(33656002)(66066001)(76116006)(73956011)(8676002)(66446008)(486006)(64756008)(66946007)(66556008)(66476007)(81156014)(71190400001)(478600001)(14454004)(8936002)(71200400001)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2710;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XLVT0VgbgGkveSYUSt2dAhI6MMg9D821yS0PeaSVJP7dGBcfIIdKjHlVcvf5KSFhM2VEe9KDFqOwBqzFqzgHllX6StdcFPChkvxcZmnxt9x7Pc+7sZEqPiPH7biXJGmTZTJa47KnsXMCNKODpNznkJPbtFPdCnLl+Q1hbamn8jlE2Okl40MEuTXgiCbq09vmJZSDJErNpK+MCd9puvhg2hqhOrc2wocDliQ1yyaIlvUCcOo8WPGloxpwV5D9xZIKTQYYPWmhMM2qzWv+/wsX9IQfuaX/Xkvykiw717mBkrO7W559iU0xuCLqa+wNSkKduQrT1EooRUz1LVwqdNqwf9zlb0qD45V47JX4Ayfqf9hDRVd6g10zb+oVc47kGf7UxyvVO07lXBQ7NLKNeNxbql6rcs3Y5GQKldGpDwIMzC8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2277e828-a145-4db6-322f-08d6f55ebfa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 09:07:40.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stephen.twiss@diasemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2710
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(resend because the e-mail client added HTML formatting to my last reply)

Hi Wolfram,

On Wed, 19 Jun 2019 19:18:06, Wolfram Sang wrote:

> Subject: [PATCH] mfd: da9063: occupy second I2C address, too
>=20
> Even though we don't use it yet, we should mark the second I2C address
> this device is listening to as used.

Sure. There is a second method for accessing higher pages of registers.
The DA9063 Datasheet Revision 2.2, 12-Mar-2019, page 96, says this:

In 2-WIRE operation, the DA9063 offers an alternative method to access regi=
ster pages 2 and 3.
These pages can be accessed directly by incrementing the device address by =
one (default read
address 0xB3; write address 0xB2). This removes the need to write to the pa=
ge register before
access to pages 2 and 3, thus reducing the traffic on the 2-WIRE bus.

Is this a safety clause? What I mean is, shouldn't the hardware design make
sure there are not two devices located on the same I2C bus with the same sl=
ave
address?

Regards,
Steve

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 455de74c0dd2..2133b09f6e7a 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -221,6 +221,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
> =20
> +	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
> +
>  	return da9063_device_init(da9063, i2c->irq);
>  }
> =20
> --=20
> 2.20.1

