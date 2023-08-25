Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B29878816C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 10:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238809AbjHYICT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 04:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243382AbjHYIB7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 04:01:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904331BEB;
        Fri, 25 Aug 2023 01:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rm/moTWkxvfwE4Ex0JGBuHrgjKVqiXqz9rnoT03MLAIj6G1lmNjmeZo0uXn9SI7FIzmrmRerssbqZ+J6fQbMmOOYY2kFrZWg58TrsLcb4u5nh7yHgHgvtAC/TC8OQxxrKRtsXW4FJ+d9ndtP0IAXBFkgxLm5l9YW+4FC5pcruRxPEmDiwOtvAr0h2+CWvsAPvfbibEh9fpApdcYtjjvscjL96nyDBu13IuCOnXkFOt+rQ0g8xUkOuH0Y1BHK7FQF55IGN/nnmuQbI7OE9vC533hv0HWcl5KwTMXjUTjCBS07WhyJeVXQX6bwbFMNYDzkuM2p11FHcv9jY2bORzpH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8+YDzG8dfjGjG6PQmV7ldVXuO+ONlJTFpQdMV8vzA0=;
 b=MJto0LtZEgkC+01sNF96wpW8TPQkthHE9hlejVvx2dtzma/gdpjx+Gc9uLZaOBH4ylAhEXfZmtwZHdbZW3XItP85+2IslYyqx6W4SPUg+a9FIKKU8qel1a6QEV20CXUvbbOpuFE8qxp7D5ZukeESgszVTPQBA0YiAZuRS0mAOKH0Cto6F8uytGGOXHoBcnwXbDYh8/oKmod5+EqESTKCVeh2w/SJfpEGMWEDWey8ODTyWlLpBD0Whu4OxQSA1FeNMADFtbJfJvYP9hFxCEabBN/f4ygvI9iHlH/5+OuTrug+r8ZdBPcs1JK6HkRVbYvmnPAqSDsEu5ss+SdL61vlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8+YDzG8dfjGjG6PQmV7ldVXuO+ONlJTFpQdMV8vzA0=;
 b=TzWYubMRvhvdnT8gnsZ+7FtAblQaM8k27f25NjNQrn18kuTgRWQWlbt12yN7pXLUjq1cxzf2uVQFvy8T5KR1o9vIBaSdB9q+j1o6pNT3p0cHbhkZqsofQ6zQckbpmZpV2WITrwFT2kBvlxtZESn0uQvfgPKXGIC9FC8Ut90Ih0I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10128.jpnprd01.prod.outlook.com (2603:1096:400:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:01:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 08:01:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels in
 struct tmp51x_data
Thread-Topic: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Thread-Index: AQHZ1svkkdmhxgyETUGBTR5QFUiEPK/6SO8AgAA9eoCAABmugIAAAXjQ
Date:   Fri, 25 Aug 2023 08:01:49 +0000
Message-ID: <OS0PR01MB59224BF249A2B17ADC6EE23686E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
 <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
 <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
In-Reply-To: <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10128:EE_
x-ms-office365-filtering-correlation-id: 1c8d979c-1fd2-4f10-4874-08dba5418944
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lbruANvCUA/1wCcHLffavAHXR7JCK5kjKwxlY9Rwm79GXUacK7CRnyd9DKt0Z4aHrZ9Lf5N9GxPyicOh/hQQzNUL9h5o4fSoEKC58RF2FP2K11u/ENzl9SQ5s9uRNTZy/qIBFM4xcRvuD6Llb6hKW8Fa2UZGs1f459/fLr85krn5XglmJn4TXQ9ccPs7eP/HVi6QJJLnFFBzKn3CT9459ji8UvbG+LSlN8apUiXl47rGiqdwCF5+p19I+O6Xhw54yvD7/2ApFql++WexksChIHwox5s7+mLqcM4aAL5qZnbvmofNrz8/BSOWFEVjEA+jShJYFUy2yatNAIE30whW87dgL2XrgICAAAS4o1bF04mvCzFgcWCapXE2xNBrpnabwRZyK/t6IXVGMmc2VLprI4tKCDIUP188Dpb0GjHW5aHeMepfZSq2Huih2Dufkk/tWDpdQySYxBWk+NZUuOOUIta7aNshRsDP9JL0qU7DpIgXxqyw8kTrd6dYVI7R4a9a2SjL5D0d+cbx8NNiJQQuXzzQY6+tsMkbcGP0Dumr4862GWSIFBwb/YTM0rOBA0CvwFtZDfl2bvL4dFrWNUmkiFqPCgY6xlOXjHYe1CJ+tNxSUHs5VblNuSeUjstLKSG9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199024)(1800799009)(186009)(122000001)(38070700005)(38100700002)(8676002)(4326008)(8936002)(54906003)(64756008)(41300700001)(6506007)(33656002)(316002)(66446008)(7696005)(66476007)(66556008)(66946007)(6916009)(76116006)(86362001)(71200400001)(9686003)(55016003)(26005)(478600001)(83380400001)(2906002)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bg1S/J2qDygY4RyUFfx6dDA6pQKA12mcCssRx2t6rqiMw89Eqcs8Vb0EGWj/?=
 =?us-ascii?Q?uYBox7D6AmJ659Ukc5COS2NPNPrdTzFBCLBTJjMtndEOsdvVpMhC4kmZ2/+h?=
 =?us-ascii?Q?Rn4J0sC1sAUE9ksQoO9pj+UpJm4tTtjKkDTEjwZhO1PRKXnnO3NJ498bT9G2?=
 =?us-ascii?Q?YXk4YY0+AZ+u8BBpHOCv4H0n5nJIF5+Xg8Uy7kkTXsEUkcGwKiARcZEw1mMq?=
 =?us-ascii?Q?p72TG7Wfzqsh9JAzuKsy0PMJWr2qw/u1/1MZT0JalStsX3vGwKXlPG6XVX2x?=
 =?us-ascii?Q?6gzaBz8/aNY5ov8bZiVpOrhjm+R2shxE8lna8Xg9So+VUaPdRY+ROnUkw7RD?=
 =?us-ascii?Q?CD9y3+SKOyOsAd+ylEWxNjNSxKoU7uS84XOgI05erBty56dMQDZpWNJZM+I2?=
 =?us-ascii?Q?snJlu7Zhm2KddNrPtIJyeLAwvMYw5ivt6gfixYtg/rp12FZWA0gPnxsRQjis?=
 =?us-ascii?Q?4UZyBwbAeA9EQTgJK+YbI/WiuxAmPNMj2chvRKd5htrG5CPLWa8M/LLFC+10?=
 =?us-ascii?Q?i6AGLrUQU4t5PwuGXWsyGhrqniJGD5rdeI3aRn9F51Z0f875pJaTpOGWW+xG?=
 =?us-ascii?Q?jtXJa1b3czRykSWakCUXDxzfhk8qxKpIfk4CyRFyNzXceL1LX08ad7cEnHT9?=
 =?us-ascii?Q?/WDsGkbLzasDNvO8NJVUouOFPSYR2FWT2iOjgnCyJ3k+MYBAt4E2KQ3vztK5?=
 =?us-ascii?Q?u6mRSGEX5rnD+zGyL79FynuldcOaWmyYN3oqevQWXaBFlszRk8A25PXNW9Hc?=
 =?us-ascii?Q?F7FtPwAAm/90ITP1mZMkQU8mVxUKjZTb3GNf/uUYRD8YZmnbvgpEeTJv1e3t?=
 =?us-ascii?Q?C1DPxEVz1guctuIYMLy6XhNnKdIzD4ZWq9Aw6WyfIgiKQa3sPOyKH8M8B+S4?=
 =?us-ascii?Q?u8xwvzuwbNlV8GpGur/5AwkPWsQZXLuGFYosaqnvOCY8s2z006mw8006JX9F?=
 =?us-ascii?Q?IzMbu2CZV6rU3MBUOC641VTGRRMtFZmksAsHmomKaEaRcH3HmaSIKahRT0uR?=
 =?us-ascii?Q?ZEuQ5xH5ByTv3ZRcgfTLiwa6a8tKHw2Vsibgm+YoDHMhHOq3SwM6K4LuqMbZ?=
 =?us-ascii?Q?W/wXFVw7YB0WycqawzkceEyZnLBCbRJ/O0KHzEeIYEwT5msjhkYwex3whKPi?=
 =?us-ascii?Q?lyHmDgUBywJWZDC0Lr/+efv78hpASeL0SuNFTOwnjurjEbRqMgVSSmJK96MC?=
 =?us-ascii?Q?i8vVXJhG6mB0O5D07juiujBsxAPgKg03Lf0b250lLyQauet62dFKWLosbaG8?=
 =?us-ascii?Q?MUmt6ff6e2LCTGtLAkJAEuTh/ITI8niknjJnF1JoiIL2rCEcYOEXB5MmLuWQ?=
 =?us-ascii?Q?ltfsV+AXMTCK06GeenwlcRxENqiM//epqn37+AmQrMRnsRSQUg+NBtPOyqPO?=
 =?us-ascii?Q?8BXBp2YTRauGHVM35eKCe1exYlPOwCpHz90NIk7NUARmwqqKSRfqDj9w9lgR?=
 =?us-ascii?Q?XJFIAlrn1nw50VluN0FWvtzxXWlPv41gdVTAp+tBLYG9MoKkkIZL0/mNebQE?=
 =?us-ascii?Q?By9NOJXoY8iWOM9fKUigh+S//wnGAhy+2AFMTLowA8TB975xb4N/iUYML/xN?=
 =?us-ascii?Q?ww58dpsf1Dhdt84xwvP4d4jdPfSz2yJaa5bDOVOH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8d979c-1fd2-4f10-4874-08dba5418944
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 08:01:49.7396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCPEsdd8d0R3rKE/ekW7a5wXuW7V2cz8/EnYw8mpLPTHEFnnsVugYC+lhXAZra/01Bwn7+0myoRMEgROCxbYdnqiAnJLngXtZGzRJt5BKv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10128
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

> Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channe=
ls
> in struct tmp51x_data
>=20
> On Fri, Aug 25, 2023 at 06:44:56AM +0000, Biju Das wrote:
> > Hi Andy Shevchenko,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace
> > > tmp51x_ids->max_channels in struct tmp51x_data
> > >
> > > On Thu, Aug 24, 2023 at 09:44:56PM +0100, Biju Das wrote:
> > > > The tmp512 chip has 3 channels whereas tmp513 has 4 channels.
> > > > Avoid using tmp51x_ids for this HW difference by replacing
> > > > tmp51x_ids->max_channels in struct tmp51x_data and drop
> > >
> > > You don't replace it, you replaced "id" by it.
> >  You are correct "id->max_channels"
> >
>=20
> "replacing tmp51x_ids->max_channels" is a bit difficult to read.

Agreed.


>=20
> > >
> > > > enum tmp51x_ids as there is no user.
> > >
> > > ...
> > >
> > > > +#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a)
> > > > +- 1,
> > > > +11))
> > >
> > > This seems fragile ("a" can't be 0, and can't be > 4) and will give
> > > not
>=20
> Not really, because it is the number of channels and well known.
> We should not optimize the code for something that won't ever happen.
> The number of channels is 3 or 4, and the generated mask needs to be
> 0x3800 or 0x7800 depending on the chip. We could maybe have something lik=
e
> 	#define CHANNEL_MASK(channels) (...)
> and or in the other bits separately.
>=20
> Anyway, maybe "a" is not the best variable name. Maybe use "channels"
> or "n".

OK, will use channels or n.

>=20
>=20
> > > good code generation (for GENMASK() use), besides it has 0x8780
> > > magic. What is that?
> > > Two bit field masks?
> > >
> > > 	(BIT(15) | (GENMASK((a) - 1, 0) << 11) | GENMASK(10, 7))
> > >
>=20
> Probably better to split out resistance correction (bit 10) and conversio=
n
> rate (bit 7..9) instead of a single mask.
> Just for completeness - bit 15 is "continuous conversion".
> Bit 3..6 are unused, and bit 0..2 are used to configure the gpio pin whic=
h
> is currently not supported by the driver.

Thanks for the info.

>=20
> > > ?
> >
> > Looks good to me.
> >
> > >
> > > Also add a comment to explain "a" and other bits.
> >
> > I don't have access to user manual to explain these bits.
> > May be Guenter/Eric can help on this.
> >
>=20
> Configuration register 2 is documented on page 35 and 36.
>=20
> If you change this, please consider using defines for the various bits.

OK, will do.

>=20
> > >
> > > ...
> > >
> > > >  	case hwmon_temp:
> > > > -		if (data->id =3D=3D tmp512 && channel =3D=3D 3)
> > > > +		if (data->max_channels =3D=3D channel)
> > >
> > > This is not the same as it was previously. And looks like this kind
> > > of fix (if I understood the previous patch correctly) should be done
> there.
> >
> > Logic wise it checks for invalid channels. But newer logic check for
> > invalid channels for both tmp512 and tmp513.
> > compared to only for tmp512 in previous case. For me it looks like an
> > improvement.
> >
> > You mean split this into 2.  First patch with just this logic (channel
> > >=3D data->max_channels) and keep data->id in remaining Places and Seco=
nd
> patch is to replace the id and use max_channels instead.
> >
>=20
> There is only one field available in struct i2c_device_id.
> Splitting this patch in 2 seems overkill because the first patch would ha=
ve
> to introduce code (set max_channels based on enum tmp51x_ids) only to
> remove it in the second patch.

The plan was,

First patch will replace id->max_channels in the table
and will fill the id based on max_channels and fix the logic for invalid ch=
annels.

The Second patch is to remove id altogether.

I am ok with doing it in the same patch. Please let me know.

>=20
> > >
> > > Btw, avoid Yoda style
> > >
> > > 		if (channel =3D=3D data->max_channels)
> >
> > OK, it should be (channel >=3D data->max_channels)
> >
> > >
> > > >  			return 0;
> > >
> > > ...
> > >
> > > >  	ret =3D device_property_read_u32_array(dev, "ti,nfactor",
> nfactor,
> > > > -					    (data->id =3D=3D tmp513) ? 3 : 2);
> > > > +					    data->max_channels - 1);
> > > >  	if (ret >=3D 0)
> > > > -		memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) ?
> 3 : 2);
> > > > +		memcpy(data->nfactor, nfactor, data->max_channels - 1);
> > >
> > > It looks like data->nfactor is of the same type as nfactor, right?
> > > Why this can't be simplified to just
> > >
> > > 	device_property_read_u32_array(dev, "ti,nfactor",
> > > 				       data->nfactor, data->max_channels - 1);
> >
> > Yes, I think you are correct. The below code doesn't makes sense. I gue=
ss
> this should be another patch.
> >
>=20
> "doesn't make sense" is a bit strong, but I agree that the code is
> unnecessarily complex. And, yes, that would be a separate patch.

My bad English. Sorry for that.

Cheers,
Biju

>=20
> > 	if (ret >=3D 0)
> > 		memcpy(data->nfactor, nfactor, data->max_channels - 1);
> >
> > >
> > > ...
> > >
> > > > -	data->temp_config =3D (data->id =3D=3D tmp513) ?
> > > > -			TMP513_TEMP_CONFIG_DEFAULT :
> TMP512_TEMP_CONFIG_DEFAULT;
> > >
> > > Are those still being in use?
> >
> > Nope. Will remove it.
> >
> Not sure I understand. The above lines _are_ being removed
> (- in 1st column). What else is there to remove ?
>=20
> Thanks,
> Guenter
>=20
> > Cheers,
> > Biju
> >
> > >
> > > > +	data->temp_config =3D
> > > > +TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> >
