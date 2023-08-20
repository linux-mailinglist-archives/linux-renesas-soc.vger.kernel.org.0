Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41EA781EE6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 19:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjHTRBG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 13:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHTRBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 13:01:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34832128;
        Sun, 20 Aug 2023 09:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiuMXwF555DSkc5LZeQ+ANhhP1Sv9mknHDJglL7gqmTwzZWol1xibrjhaMvoyIAcb78uGKuXShn5lhbyH8u8/wt9mkjtiw44cglA+rltntoJt0MkwUr2wKwduEpdE7iS8RDPlkZ5uEHBBorDB0HDMz68HW5bOlB52wAw6qof6vPECcSFtw24x4rcVK8zJP+Ij8Nlp5iEiYtRZO/82sKfJeISAJHRmNRAr0ndxAa3jt3BsvQ483pC94ElK1DHAMCun2fMcEuMxP6n+Yfko2hvCQsfx/Pf1fSXj1MxVtqyqbpeFbfZPdqIof2c/DE0uxCy4C6j6XXldKGZlxC/3/teHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNPhvoFWVYlqUXQoSSf9DSqpwirfICTeeckI/X34fvw=;
 b=YHZS0Cc1qeb7M8N796PePP8l6YbUB2DDTFiyhwyTpe74qWZHDgScSkga9XrtPvkZipX/dsPhkDmsSXu+e6RcdKEkU9ujCoXC2CUymESQTHuAzLUqkkah6WSSUdunPQZGER/H18vJn9Aue6TcI8wdxGdCwtwV0tk2RlD3zJ0VZ2O5RGuI8bx9s7qiHMRwYGEAE6+xtVs+Lzd8kuVh0XyBioL7uaFSaw/23yjyrouYeg0xvXxjgSsRk8TnBe9F55pAUO4U4tGHfib+4VNNSy8driQ2a7yifPMCIy0hn1IcULqSr7yYpfwhQbyKWZVC4id3PrS2kebqzaKaC8pmpIiT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNPhvoFWVYlqUXQoSSf9DSqpwirfICTeeckI/X34fvw=;
 b=A+OMPiys7jmGL/3hdw1sMe/R7CgVW6x80cOvENjVH7sO+rsGthx+oAs3ONZl6vLZxFXsoVivm+zXwPPoUMjscfj6gK8HW1igcxq0gTfQjYxREyB1WUlUXkrvguG2FQLrUyTy+mndH0BQIFdOiWGAp+t2/35ngrlNk9xLf+lOUcM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10782.jpnprd01.prod.outlook.com (2603:1096:400:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 16:56:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 16:56:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: RE: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Topic: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Index: AQHZ02S7TE7/pX8dqUyN+2Y9gszHrq/zN4GAgAAK7oCAABQ2AIAAC5Qg
Date:   Sun, 20 Aug 2023 16:56:56 +0000
Message-ID: <OS0PR01MB5922C02D0984F36C8CDE98888619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
In-Reply-To: <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10782:EE_
x-ms-office365-filtering-correlation-id: 7f591d08-8434-43a4-2b4a-08dba19e7651
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rpluD3YNdZ8Joij7vCx00n/1IZCIJnbYIQ6cW/zbW2Zz7xEjEiVBy61g3GZj+OuGMMiqr3FzhIB8j8yY72cyrqb+E/gdav479MLZhGv1MKhRZEozTd5TTf0XMJCl4LrVK1TygVs2UbQBqOSpKXacV6506MR3iFCDdSfuNTL5SfF7JpujoyQar+zHlMWw3dZXpY52htwPLErvYsyUyPCQyUvS0NPfPwVFcmZcuTCi7sO9aWYidHD3JIFFybSOIix+390eHpw4orYRq3iTzXgzzMJ6FNW2n73v85p2T+ENe91c2epeaYO/rwf/owbxhrltz9o1oVXTutD5Z0uQCL9DQWaAQBpYaa7F+qE7Ot1F/3ZeUjdKGVVFuiS3k24AvXzidZy3Tv3ojOMx59FdeuHqalPcRotPiQ7IsNpqpep8BSD7rJK0hv59HFT2o+fq2EZyuMW1ZuSl9dFmzE3G5gYC4IWyrQ3kx3ndvxsNKYd9JzsCxg8aj1zPrgFhbHDy5PYOqYOQ304zidDUqY4JaiQ5bBV7zeMQg+A6X5jNiauX/jE6w4zWpFuMfs+zWcLkRdYKRqksKFT6Z3uftzKCNEeL6EM6ASPxfYdfaAY/j6pOERUOhSavfLvSyk1BHN3E6LGq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(76116006)(64756008)(5660300002)(33656002)(41300700001)(316002)(2906002)(66946007)(6916009)(66556008)(54906003)(66446008)(66476007)(8936002)(4326008)(52536014)(8676002)(478600001)(71200400001)(9686003)(38100700002)(38070700005)(7696005)(6506007)(122000001)(26005)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y1wAdZ7iCrGhuzyxl5ld5UjO/OmxqJq11AF4W0G+mLwx2PPyJ55SGZ3a0Mu8?=
 =?us-ascii?Q?hEqBH5ECmv1j4OkIZ4GTIgtSU2TUcm+IZte9tt+sODpcJyno+EH92UXLvqfN?=
 =?us-ascii?Q?T33FgiYu+OVevbJEzbZzlZC7nzr9aoAc3rPEifaseZnAR7/plUs0VY3ie+eL?=
 =?us-ascii?Q?+3HiVmAeDlOt2fcL4C3mrRsM55FWCIch1WkcCNbOno/KKznDgfhKuH/wzckT?=
 =?us-ascii?Q?ek9RGL5s3pdk+7MdAUvUtESNfuJRrgPswugewCkZv7CHJmvbib1Jbg/tliGD?=
 =?us-ascii?Q?Kk0UQAgfoV8IdR1w57Pd+FEQIfHzYlYt0Q4meXhFHNrScQ4sx4Do1NdbmQpN?=
 =?us-ascii?Q?PYplalUKFF/59opC+wR4cMBntnuvCLsnOuBzKZVwdexFByS8wkkH3RXC7jvY?=
 =?us-ascii?Q?sI0UpWAvQSUR0ZxjFiLXJTmHCTB3eBw/poed8/xsNb5nq1TBv+L1R2pkgIHq?=
 =?us-ascii?Q?FDhJlfbjzBCkZ6MrmHxmQGyEe9tzrlFz7Y4UnIRQNs9LprEVtJ7mfviMIpb2?=
 =?us-ascii?Q?nMFs9qCYYAmzwaBRYkUo2Rp9o0y5tT2OWb6kXfDFzqK/TtxmPnQ7bZ/imT1l?=
 =?us-ascii?Q?EJ0ope2OfoN6c9arHoShYca1WosvUeeNGerdUgnuABOx0KzB/h3kWXJqu7cS?=
 =?us-ascii?Q?ijxdk6AjApopRWYFOHmGW10+cbkDLoXVP7dChMZqSCDdjxJAYWySVat9w6Ku?=
 =?us-ascii?Q?pJ9vC5fuVUjQ+/Fkgm5Qrp6E15l6HTRqaSJ3wuGPGKdARwd0O61ucoBh72H6?=
 =?us-ascii?Q?cicQmMVEQ7Ax0D+3wmADafx5VJdmUsT40nurfoHmGMT9usPD8tgoLvjaexZY?=
 =?us-ascii?Q?/x8N81Ggq5II/E928yjW5OFUAij8fT3m6JpIqzz18plZAS43Ab4Htofm1NWH?=
 =?us-ascii?Q?pcEkx1HB2BPEJFNUksZn2Yelt+B9TE4SKNusFSkMqlPN7aG589gx37xddpJk?=
 =?us-ascii?Q?8cqy8NTsckwN1ur6RY8sAesxfMF1rmpCCBPG8EXeOJezGfOR4qFC5PNREDiM?=
 =?us-ascii?Q?HUCyZRJx+imS0rSGGjqhA4s4BEdkKLMi+f4LL7hFRkNwlg/wK1iplMYrlUIK?=
 =?us-ascii?Q?H5LnsIIWflgHpB2zBIzQX5GxNGzZjJoiHQQltZnJmlifeQ94+6ivdGpMcqQc?=
 =?us-ascii?Q?j+cpG7L2WSqZbEmfwyDeTRQ18oJTrVr9YBd5R9G/Pk+Qu9+TDBQpcY8Vt7Kh?=
 =?us-ascii?Q?EB9AWsy90vuUZuLr4k0GERpC8vSCM2ypagdKiS1LqcG7WYFm2S7O48FyV+0n?=
 =?us-ascii?Q?G1IwkKMsBH1gGd86sFGei/aS+vKRRVqCVefLX0hb+rQJFkZ086Y7GRzmohBx?=
 =?us-ascii?Q?qLBvehpLk4e9KR138UmcZt5QD4uKse717ns7R9y3ToVGCfnb+Ror4Gpl1Z1B?=
 =?us-ascii?Q?8WqzQsy+6maiwhRwn7YWJYsIazLJpSByCb+AWUA6mrP3EZgGJeptuU5fedGn?=
 =?us-ascii?Q?6Uglu+Uc3BexrXu6tWJyXLbu/JzWOoRfYv9Wwa4iZCa6H0u94oRsxjHN9r55?=
 =?us-ascii?Q?yFgOcBJqiftfmte6kqEuE4B9/SXV89vEfPCucUP4iEbl/WhFQSHTmfa+vDiT?=
 =?us-ascii?Q?k4xKFScApTkPKB11JBWfZEJWF6sNMDAY5CmqYKhA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f591d08-8434-43a4-2b4a-08dba19e7651
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2023 16:56:56.4378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t1tvc4F7YP5eU4tYf3Fky0lLmgxMgzMlL69jWZZXEMpy9ZAIkAend+YFULsURoULVgIHBF7TLa43bYevT/39uGTDhqCrm02iCLKHlFDzV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10782
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

> Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x mat=
ch
> tables
>=20
> On Sun, Aug 20, 2023 at 02:55:08PM +0000, Biju Das wrote:
> > Hi Guenter Roeck,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the
> > > tmp51x match tables
> > >
> > > On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:
> > > > Convert enum->pointer for data in the match tables, so that
> > > > device_get_match_data() can do match against OF/ACPI/I2C tables,
> > > > once i2c bus type match support added to it.
> > > >
> > >
> > > I don't see why this would be necessary. You don't explain why the
> > > current implementation would no longer work. Various other drivers
> > > implement the same mechanism as this driver, i.e., type cast the
> > > return value of
> > > device_get_match_data() to a non-pointer. I'd argue that changing
> > > the functionality of device_get_match_data() such that this is no
> > > longer possible would be inherently flawed and would introduce
> > > unnecessary complexity to drivers using that mechanism today. If
> > > device_get_match_data() is enhanced to include the functionality of
> > > i2c_match_id(), it should be done in a way that doesn't mandate such
> > > an API change.
> >
> > Currently nothing is broken. There is a helper function to do
> > OF/ACPI/ID match(i2c_get_match_data). But Dmitry proposed to extend
> > device_get_match_data() to buses  so that we can get rid of
> > i2c_get_match_data  and future it can be extended to SPI aswell. see [1=
].
> >
> > While doing this Jonathan found an issue where it won't work if OF
> > table is using pointer and ID is using enum in the match data.
> Moreover,the proposed API returns NULL for non-match.
>=20
> I think that is may be problem because many drivers don't have a value in
> the driver_data field. Maybe that doesn't matter because such drivers wou=
ld
> normally not call device_get_match_data() or i2c_match_id(),

Yes, that is correct.

 but it would
> create some ambiguity because those functions would no longer work for al=
l
> cases.
>=20
> >
> > So Andy proposed to convert the valid enums to non-zero or use a pointe=
r.
> >
> There are _lots_ of drivers where the chip ID is in driver_data and start=
s
> with 0, or with the field not used. It is not my call to make, but I real=
ly
> think that demanding that this field is always !=3D 0 is just wrong.

For hwmon subsystem, this is the only i2c client driver using device_match_=
data(), other hwmon drivers are using of_device_get_match_data() and ID loo=
kup.

>=20
> > In this case, pointer makes sense as the hardware differences between
> > the chips are compared against type rather than using feature and
> > driver data. In the second patch, I just used a driver data to avoid
> > one such case.
> >
> > [1]
> >
>=20
> The suggested changes do make some sense independently of the API change,
> but not as suggested. I'd be inclined to accept the changes if the number
> of channels is kept in the configuration data. With that, the chip ID wou=
ld
> no longer be needed. TMP513_TEMP_CONFIG_DEFAULT and
> TMP512_TEMP_CONFIG_DEFAULT are not really needed in the configuration dat=
a
> since the value can be derived from the number of channels instead of the
> chip type.

Yep, instead of using chip type for HW differences,
we can use a macro to get default value based on the number of channels sup=
ported by the chip.

>=20
> According to what you said earlier, that suggests that the only necessary
> change would be to report the number of channels in driver_data / data
> because that would never be 0.

OK. Since the value is less than 16, there won't be any issue.
device_get_match_data() first look for match against firmware
nodes, and will fallback to ID lookup().

>=20
> Either case, I would want to keep temp_config and the number of channels =
in
> struct tmp51x_data to avoid repeated double dereferences and because
> temp_config could change (resistance correction enabled/disabled should b=
e
> a devicetree property, conversion rate as well as channel enable should b=
e
> sysfs attributes, and channel enable/disable should also be devicetree
> properties). The value could also be used to support suspend/resume in th=
e
> driver if someone wants to add that at some point.
>=20
> In this context,
> 		if (data->id =3D=3D tmp512 && channel =3D=3D 4)
> 			return 0;
> is wrong because there are 3 or 4 channels, meaning the channel numbers a=
re
> 0..3 and there is no channel 4. This should be "channel =3D=3D 3"
> to disable the 4th channel on tmp512. Interesting that no one (including
> me ;-) noticed this.

If I am correct, as per above, only max number channels
supported by the chip can go to device data. That is
the only HW difference between these 2 chips and other
chip specific data can be derived from this.

Cheers,
Biju

>=20
> > >
> > > > This patch series is only compile tested.
> > >
> > > I assume that means you don't have access to the chip. Is this
> correct ?
> > > Just asking, because it would be great to have a register dump which
> > > would enable me to write unit test code.
> >
> > That is correct, I don't have access to the chip.
> >
>=20
> Too bad. Eric, if you are still around, would it be possible to send me
> register dumps ?
>=20
> Thanks,
> Guenter
>=20
>=20
> > Cheers,
> > Biju
> >
> > >
> > > >
> > > > Biju Das (2):
> > > >   hwmon: tmp513: Convert enum->pointer for data in the match tables
> > > >   hwmon: tmp513: Add temp_config to struct tmp51x_info
> > > >
> > > >  drivers/hwmon/tmp513.c | 51
> > > > ++++++++++++++++++++++--------------------
> > > >  1 file changed, 27 insertions(+), 24 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > > >
