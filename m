Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB23378940B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 08:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjHZGag (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 02:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjHZGaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 02:30:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6211FF0;
        Fri, 25 Aug 2023 23:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZVFDT8iBwV3hMDHO51wUMGHEsQMZalody9dX+UQDZtySyoVKSu3AuIswAp/OW8OfZtqlGKZxFyfqGpUB990R8ay5oaQLL/Au/sWLEN43L1iqRg4nDGiWlF9cCIUqWl/p9/M24Azu90bKJ1q3zsKXMJJ6UEdRn4OfdKtIidGRSuLm+BHwQEg5MCdQfDe/nDNayJJfdw16DeuWTro0cWAA6NvBTQO8UJUB642TLNNOUUblxMyFYVXuZH50/YzSb19tEe+9Fu2bFek/UnpdOSBc1azqoI5wwAnIqkTzFMSviH17pEtClnyiXhaaqRS8Y7JVBL6tH6UtwB7hCag2htFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xyrbVEWFh1HO9huaCHu5jBnNjsr1jJt+TzBuhiRcUc=;
 b=PIZ11CMwS4iLsRNGTtI4NqgGpr4sfiCuBUujvpjXTef89pLWE8wmq0Szfylv/EUjNqEykw5UN8mf52qUd4DhEnOMuO/X+rtJ1J86dUUBgOwiCcjzRQ82oI+riuZ/huOSorjGy95QPf2KiKv85NqrcvTdo7YMopxakJkZ7MKrKPRhzB8sPCBmlWDdTExOXcDrpA/6Ofk9UDvn3Gdx6hQ0WkCDA9l3Erxk/YdSptGDlLx8FFJ/O0WMiftTbjIGysPK4ZxJp2DCbltvcxkB87SGUMQSupF+bSe0sgYQ8Z/l+RwBD0NfpOLiOnY4ZTVgFeM0RoltWkl7ijNzYFKae0s7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xyrbVEWFh1HO9huaCHu5jBnNjsr1jJt+TzBuhiRcUc=;
 b=hTMXAehVoKp6osyAgx93jkuHCwJ8pmGR9JDwtBWxToRxhP0R0cv74Yp4W1JECgiWxUIfQwS2Yj0T+dG+z+LoyZMzx0CvpqLnF3BakYqNZ139kBY6p7y7ivtq/AiqVce5Tjkp3y/Ev6JPnv3uzdYYqX+I4G0tPigLISFL6/8XJjE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11674.jpnprd01.prod.outlook.com (2603:1096:400:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sat, 26 Aug
 2023 06:29:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Sat, 26 Aug 2023
 06:29:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] hwmon: tmp513: Add max_channels variable to struct
 tmp51x_data
Thread-Topic: [PATCH v3 1/3] hwmon: tmp513: Add max_channels variable to
 struct tmp51x_data
Thread-Index: AQHZ15ZDksvMpi2LX0+kq5fPt33l6K/71GIAgABJHKA=
Date:   Sat, 26 Aug 2023 06:29:54 +0000
Message-ID: <OS0PR01MB5922F70D22C0971B17BBF5D386E2A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-2-biju.das.jz@bp.renesas.com>
 <bf401e42-320b-4d8f-a9e5-f76b4c7d855d@roeck-us.net>
In-Reply-To: <bf401e42-320b-4d8f-a9e5-f76b4c7d855d@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11674:EE_
x-ms-office365-filtering-correlation-id: 4f21afb6-b178-4207-8462-08dba5fddc46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KXn265HoCAteLGVLbIqWefLGEvWVkorN8yCjn+47ju4xzOhfG8hTonE9+J1WX31YQH+1K24ZwXQxj/YZvrFa6UKTKiAlLkOdXthO+xh5rnTVqH0VqhMTJgJqHpueb3uuha8m2HEvjzQCIqSUqU2aHS0Qs7Fe2j4xvs8CQPiFubIQw0f3e4t2ruswudNex2U0jP6OtfNlZvs8VlEQYKqBO+7sD5e5VgrBo1mCrsmmIWnUSw74ZtrOLIVXTutj3FM2dhIfW43qECkt7xKDcdzFBj8PpdA+mgU8uxAmw0FlaOFkkPVNAfOjiuhoHbc5CprFrGR4el99+FYqsooqv+QKCCEfbH+oHm/t0SQk1iOqGo0/KVxuDSGY7cERTWQby7FeYjnexXilQaQYafkKHQEeNcGl66pFfynFMgL2FiCmw3k8Rsm4A+yfbRcHm1lAkggiKGz3u5MgFhoGtNwVv4sJ4kdOm2RzmyJ/UQ2Bcjxo26dP9609URQDZ+wbiUEEcvivHCUzWneXLf6mw7+AeAGRPWH7lFwnp9BDFSXBNcq5IcH5FswR5mAB+fGnT5b1ETB90w6Idoq/lkk6scEquejr74bPyVXvJyL1whM0DC9CYpUODafWliAyE5joCJBZgEWW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(1800799009)(451199024)(186009)(71200400001)(6506007)(7696005)(33656002)(86362001)(38100700002)(38070700005)(122000001)(55016003)(83380400001)(2906002)(26005)(9686003)(478600001)(76116006)(66556008)(52536014)(66476007)(66946007)(8676002)(4326008)(8936002)(5660300002)(41300700001)(6916009)(66446008)(316002)(64756008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8Ll6RwGAAdBAyvVXqtU4OBT3IIfLsg6WqkmZx7xHP+WB9aKZFZgoPV9VHAV2?=
 =?us-ascii?Q?YPuDlsWqoWw9vW21sKsfS4AtbXmm1abCmczDRLG8ZjgB3Fm8+nQ2U3NiVmQt?=
 =?us-ascii?Q?POuBbUziQxUXjR5TQUl9C57Hvia8FJt+aNu97XazhfXoORZfqw+y8UJmeWNb?=
 =?us-ascii?Q?lXKFFeqsXchsxCztrIU+hN5BlwQxKmDSlC6GmjP13Go8G8gpg+FeYlBIkFsL?=
 =?us-ascii?Q?LNLz2xxWROujTN7TNcJDtlBQwCuCHwQFQoDq2RKrZrTRwpFCB2X+A7nDm+qv?=
 =?us-ascii?Q?l8cctacKzavsM5mocME7cqkNUBeFEj6hVAVMxlAqE3GPIhD/dX3Dm2dQVF+F?=
 =?us-ascii?Q?gP98KEtW2QpENs/MmEMp5uvvqh/1dfRa0aEkyR1Hana1dsrvHpdSZWjES2W5?=
 =?us-ascii?Q?T51Ku38J+Ypo6RZHL/nD8KJRWzceq1pSRgNPA6mzk1ViP3cdFycU1Z5CtJoQ?=
 =?us-ascii?Q?yvDdoieDMkBli39aznq4XS/7Zy0TsssVqp2VzwRJjYl0LGxBLQ8iA5mXfwA4?=
 =?us-ascii?Q?+xw2kKUI1qYiNSqc/S8DmyaQ808ZXarnorYxuqp6faQwLGF7u2+Dza8SBcgi?=
 =?us-ascii?Q?oFO9nlZwYuRciFzVn/sjJoNWb5SpaOor7kMEE4+3Cg5IQiH8Pf18FcqI9gPX?=
 =?us-ascii?Q?paBRe334bnotucpTNO6o+YI6jY2yHVCZgl3jyWcp9yVFRGRQhSfxm9ceT3aD?=
 =?us-ascii?Q?ToZtk8qECkCDDpJJejXkUGH6Nv2uKY8HDNb0AikJWWQUXn+LU10dpDnJOHLY?=
 =?us-ascii?Q?kDUbU9kKAXcQyX6hvzMGL3DZ8ScDjSTfzlIoE/5mYzwPiOH2jA/3CoHzXGEl?=
 =?us-ascii?Q?B45kB/ET2LxGXfXBqAO5lK0enQ/BWBVRYCAsCYwuKElY7Uxh5EVc0FnGhRxU?=
 =?us-ascii?Q?CqdOQ8VCR4M28zziF7kUq8b+UoEaMf+lRjGHmwrZmVdf91TxenAUyHb1rx0d?=
 =?us-ascii?Q?Je1Zgdivw/sFyv/6r3R1SXUjfkr34hiSg1gg2RR5O772OvB9wu3sW0EWt1+Y?=
 =?us-ascii?Q?JsSKWf46IMmiTG/d2fK9e7mwwLQzf22jBUD8BJNy23+TtQucActAA2+Cn/LX?=
 =?us-ascii?Q?lE0J6ij0+m0u6GBDGTEMM/Z1/UE1qeqVXUi+vq7EZmaQpgZRG/HKUtVhW+3Q?=
 =?us-ascii?Q?Uo9RiiAyvEKVa3fAJiRfQy+7g7veNysTOr6GyylRH4Khxbu4l4PuPnXJWT/H?=
 =?us-ascii?Q?10vKW37VMngu2iztmZ/8vRncD30b3YGtJnjE/a59j4hwvkL29hpkkYYkuHdV?=
 =?us-ascii?Q?FltITioUiGpXPEW62QmCmyX0SDcn1FRCKFAkjdBP6je9DrwrY44LgQedzaKY?=
 =?us-ascii?Q?ChM125d8zBtlrrQo34/Av+1FQBcv9NL6tpU/CNeWVpKoJTDrGLyeKnVXWaku?=
 =?us-ascii?Q?6PyMwAL1KQ5gk0Cy55nCR506v2xubTtrSSHK1YkR/HY8rDxLVBGv/irlX+K6?=
 =?us-ascii?Q?CsAjhTq7pe11xr8poJARj5z/TTVkwzj3u09jY3Xt9hB1f9e9J5GxyeQ1DN5g?=
 =?us-ascii?Q?xtPF5wMncQww6UZ4UFyXk267jb68LcyYjMlIIDX87czGrX7aUME7gbl3W8rt?=
 =?us-ascii?Q?RT/anGWng+ZXd4x5ZxjeEgoBjbEaDwpGybaH7bSk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f21afb6-b178-4207-8462-08dba5fddc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2023 06:29:54.3555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GXLFPDNY7yt/3wOE/jsapycpHGIcLkbMOsq6wBSYCmtL6O4mt9c47X18jIz7BrW9gTd1AoYWzzzT6qxSC1ljvZn1Lfdb6ZPQes+ibf0DqcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11674
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Guenter Roeck,

Thanks for the feedback.

> Subject: Re: [PATCH v3 1/3] hwmon: tmp513: Add max_channels variable to
> struct tmp51x_data
>=20
> On Fri, Aug 25, 2023 at 09:53:43PM +0100, Biju Das wrote:
> > The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> > using tmp51x_ids for this HW difference by replacing OF/ID table data
> > with maximum channels supported by the device.
> >
> > Add max_channels variable to struct tmp51x_data and fix the logic for
> > invalid channel in tmp51x_is_visible().
>=20
> This patch does not fix anything. The existing logic in tmp51x_is_visible=
()
> is perfectly fine.

I agree. It is not a fix, but it is an improvement.

Earlier logic checks invalid channels for only tmp512,
whereas the new logic checks invalid channels for both
tmp512 and tmp513.

Cheers,
Biju

>=20
> Guenter
>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v3:
> >  * New patch split from patch #3
> >  * Avoided Yoda style logic.
> >  * Replaced OF/ID data from tmp51x_ids->max_channels
> > ---
> >  drivers/hwmon/tmp513.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c index
> > 9a180b1030c9..99f66f9d5f19 100644
> > --- a/drivers/hwmon/tmp513.c
> > +++ b/drivers/hwmon/tmp513.c
> > @@ -113,6 +113,9 @@
> >
> >  #define MAX_TEMP_HYST			127500
> >
> > +#define TMP512_MAX_CHANNELS		3
> > +#define TMP513_MAX_CHANNELS		4
> > +
> >  static const u8 TMP51X_TEMP_INPUT[4] =3D {
> >  	TMP51X_LOCAL_TEMP_RESULT,
> >  	TMP51X_REMOTE_TEMP_RESULT_1,
> > @@ -170,6 +173,7 @@ struct tmp51x_data {
> >  	u32 pwr_lsb_uw;
> >
> >  	enum tmp51x_ids id;
> > +	u8 max_channels;
> >  	struct regmap *regmap;
> >  };
> >
> > @@ -434,7 +438,7 @@ static umode_t tmp51x_is_visible(const void
> > *_data,
> >
> >  	switch (type) {
> >  	case hwmon_temp:
> > -		if (data->id =3D=3D tmp512 && channel =3D=3D 3)
> > +		if (channel >=3D data->max_channels)
> >  			return 0;
> >  		switch (attr) {
> >  		case hwmon_temp_input:
> > @@ -601,21 +605,15 @@ static int tmp51x_init(struct tmp51x_data *data)
> > }
> >
> >  static const struct i2c_device_id tmp51x_id[] =3D {
> > -	{ "tmp512", tmp512 },
> > -	{ "tmp513", tmp513 },
> > +	{ "tmp512", TMP512_MAX_CHANNELS },
> > +	{ "tmp513", TMP513_MAX_CHANNELS },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, tmp51x_id);
> >
> >  static const struct of_device_id tmp51x_of_match[] =3D {
> > -	{
> > -		.compatible =3D "ti,tmp512",
> > -		.data =3D (void *)tmp512
> > -	},
> > -	{
> > -		.compatible =3D "ti,tmp513",
> > -		.data =3D (void *)tmp513
> > -	},
> > +	{ .compatible =3D "ti,tmp512", .data =3D (void *)TMP512_MAX_CHANNELS =
},
> > +	{ .compatible =3D "ti,tmp513", .data =3D (void *)TMP513_MAX_CHANNELS =
},
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, tmp51x_of_match); @@ -720,7 +718,11 @@ static
> > int tmp51x_probe(struct i2c_client *client)
> >  	if (!data)
> >  		return -ENOMEM;
> >
> > -	data->id =3D (uintptr_t)i2c_get_match_data(client);
> > +	data->max_channels =3D (uintptr_t)i2c_get_match_data(client);
> > +	if (data->max_channels =3D=3D TMP513_MAX_CHANNELS)
> > +		data->id =3D tmp513;
> > +	else
> > +		data->id =3D tmp512;
> >
> >  	ret =3D tmp51x_configure(dev, data);
> >  	if (ret < 0) {
> > --
> > 2.25.1
> >
