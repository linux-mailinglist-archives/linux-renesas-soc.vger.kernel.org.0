Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB43F78802C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 08:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbjHYGpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 02:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbjHYGpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 02:45:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F81CD5;
        Thu, 24 Aug 2023 23:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8l5jyGPZYrJvnhqKh5gW03PcmT8q+kY3Wl6tPFLJHr5YBHJxyE5x8GyN0/SC0dzbXUMsq9vn4+vmFTNc86IP3LTbInKZqkw12XJgDOsSj/mufwhtlKYz2mqcB76+7IpDMMUGa+To29CyoMXMOuGn7/PyQz725MutO/31nV6PzUyWdk1sn37SmUwyislDBEwtFhdHtaODUMSTC0I1SppEp0fdkO0nr1/lNw6PofBy2ZW2pbdm5vHdstKSAMOWGmFHkEKjW1foEgl+xAZveSdXbRtnPki1V+M0C3ifk9e6C0+uJpsGcvamsS1aiXndF3xFJWfve9qKd6ZYSxGuT2lUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itHx4tGOW+b0QBia4b3xFkTzaWdIDCM3D96jPWBkh7I=;
 b=R7DYnNcYIUWHWGO7cJH8CEx/H7m6eg52mLFt514HqUmr+UnRqxy37wR7H30wBcF0eZNX1CsUYSF1sq47JYEkeeqm6as6TXHW1xIKN4GlsiwPlKppzd3QI1iO9rty0Nq5aZqLO1i+SIJj9ToMYZyYvag9AWFsONpxGKyGIM9M+FUjO8Mi8k+3/3JxsDeg9emm/cXd7E2CtsqO6+gSP9CqilnvN503/6b+Xz8y7CJ0t9f6amRFkvYWHqKiXeRRnxB5ZzxBh37U7sEF/ISfYYAkiTxlzylKMXyUKHuXYnpzRqt4+Jgbuc0oSUUg/pd0XCsnY/0eOa4z2UMul7L/15E/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itHx4tGOW+b0QBia4b3xFkTzaWdIDCM3D96jPWBkh7I=;
 b=fADIgB8maW/EVGneAV5wfS3nRmFt3jBylmdTRayysKtriI30u2aOcz946KXx19y3JUBkS8MQkoyAWS9FKhZ3ikCR3J3C7oIJEdMquXslEtXyZeFvl2aQzR7L0TuiVOat3MF2nuyWfXtqEGm8hj/EOSLmAqqichIFR06Df+/3g5Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10077.jpnprd01.prod.outlook.com (2603:1096:400:1dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 06:44:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 06:44:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels in
 struct tmp51x_data
Thread-Topic: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Thread-Index: AQHZ1svkkdmhxgyETUGBTR5QFUiEPK/6SO8AgAA9eoA=
Date:   Fri, 25 Aug 2023 06:44:56 +0000
Message-ID: <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
 <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
In-Reply-To: <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10077:EE_
x-ms-office365-filtering-correlation-id: 188a270f-7c59-47c6-ad71-08dba536cbc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1sYrnbMAnBc+S8MdKoui2cR/4E0gzocK+yHBJP+kWHLKTNBHZA+2K680YPyN3JtibMnTrK+yxUfyND4IjRBvgW9a7WQ1zwm1QfSZm97GYDOCwgf6t2BCvMtrOMkJOKlMZHupZ5+ltBKoNjbG+7WWAx1RjA4CpKuRwcdQ9UFzmsqW/G5lnllx5yGkBXj5oA6g0nvwjAlcHn2eXOwTnYu33HS2MuDznGTjGWpu08GK9Nsn45YHNSIAnKgJgxlk9bAFY+wIZ5iJREngT9CRtyzDO/VaDIfcG2nADTJxUfab7+A2kzTIBgaEoJeltL46lAaF8FN/mNDbqdt760RwsewdmM6JxDwu6OonasKYbpHk0SFRm5+1EPuFdi90kS5UYf8PYqBpLSfOIAUC5FYOfmwpOVpxiID+O6Km1Rt79CQWLEpkx/9n8rHb2WkhmyJGlA7oWeHOEYeep0OQItx6twdT6iOSbDo8OexBy9TBaTl5vLJniheXGaQxMu65Jr3knL+mgduDpIZTNouke/0a8RDdTghwuMHL0HNL8zHSfSoooNUT85zqkEWU6N3KsZbago3M31Dkg3CcI67IRAXzBpfD/5t0xFF9MRkWIO9Dz3/KOqiEO/TXM6ARP22EV+jKHrO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(1800799009)(451199024)(186009)(83380400001)(9686003)(26005)(478600001)(55016003)(5660300002)(52536014)(2906002)(8936002)(4326008)(8676002)(38070700005)(38100700002)(122000001)(6916009)(66476007)(66556008)(66946007)(76116006)(86362001)(71200400001)(41300700001)(64756008)(54906003)(6506007)(66446008)(7696005)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uoR4Z8lFN9dOw58eMzvriGxIriNPmQHXSpHwKVkBCqeTthRy6JeoKCv9ThYE?=
 =?us-ascii?Q?EZck81mINcpGrX3LqMw7pAwNUu8eZY7L20CpeIfa+6hWWzY0UBob8fL558yh?=
 =?us-ascii?Q?SIW3lx5+Kpt8edCz8EPQ42CXVvtslOFeQcI9YAKnZli6O82qZwJtGMg4W/aV?=
 =?us-ascii?Q?oQAk0Lw5WgbsoV+ysFBY2EU/e21paed0kQRxstGniL2yBINMK4ZcE9d48yNn?=
 =?us-ascii?Q?1QQKbDJiD75Y/79hBnfLr4JAaF3fR0hW4mm5BVddeknCU68SP9IUT7YMuweL?=
 =?us-ascii?Q?bTkqllYfITqjLTzmMtbNlvzFw1tyWgEjYs0G+pnJ1QDJ3r/E45aEkqSOTlGM?=
 =?us-ascii?Q?iT8XoY/CvCSWx+HqsvELJiy5PWJlFvUuKZC4n6hqj4FXRSMCRmTI7outDIJT?=
 =?us-ascii?Q?aUse5LFUN4Ehg50pBU8OVvE2ktKPYgWeWfOByDsn2iDpiKJpazXQBDM+9Z6K?=
 =?us-ascii?Q?V6AsMXczoarOVAYQtMo8o2qEQr/x43nm3TV93pdFQFoHNDH8AzzirXRvwIIc?=
 =?us-ascii?Q?xCIkCiSJ8uxGr6Y54z/Yy1gY6aWsFEXR0S4e9KbIKnCqWyUTzXdUvdAbs51a?=
 =?us-ascii?Q?b/WODqRr8jjuG+5dxmL97rWWGf8lzdlWj57XwekudgsUlUb8gQNKMBWz0DDy?=
 =?us-ascii?Q?e8bpK1PHctB7q/TPH8JAkxdOTfNY/fskSilD247tbXwjywFJGmJtRt1Hwni7?=
 =?us-ascii?Q?GAQp5A7qBXOrlXhPTi6Znyz01wIutQKtjnW7DwNIGFf4iXuApFPoBsRPE9qD?=
 =?us-ascii?Q?xI+lYO8EFTfaroTZEdurexESt4bhvoVfIIw3KMc5YoGu/B3I3J2ZDJBmTgoK?=
 =?us-ascii?Q?hxrLpAy+oPr6D+olS8zgPi2mFuk7L+WbaxdyCGOx9h8qLqip7nj0GtTGVMX6?=
 =?us-ascii?Q?LuGeW0a0VSJudshaA6WBhupY8QmjWB7HhziLAItLXe4JaeDh6cDWf5UgrRNO?=
 =?us-ascii?Q?ZVzEdvTAtn7AR0UWTIbLBapzNrCSFL3Ln3j0SomhRKJ7kXgPl8j7ljdPnfYu?=
 =?us-ascii?Q?a9grpWzYoG3vra9nElo5BPmBnbXS3JP9eiyrgUuLexfX3UJEVWzOdLsQT012?=
 =?us-ascii?Q?oZKZByUgIEU4XrhN8N9pD1EEIVB0GYNX8ySB/ytBvFgNTGu7X3QlFO/uEx6P?=
 =?us-ascii?Q?H7bl8ZdQl3j+GOArnKQ1a/SEqeKgWhsfHAZ01ckoGHpkftLTGiQIJHDzE6dY?=
 =?us-ascii?Q?kyKtjzO5GW6RZmHX8qaDG/96NQ3pjjlMhGnhvTvD64N1HTqSunaszTC5mRj/?=
 =?us-ascii?Q?776jo6nWOO6bLBscUkOo/v0WyHuEOxj3cgwY7FuVL6WVpue+VsAR93KsaKRF?=
 =?us-ascii?Q?CYbW1EzGCtM4HFgUZhWPQDWyk4m+YLsWc9ovEMmwaC4m8CNhzt4ffJ82aDLf?=
 =?us-ascii?Q?zg+2EYJ1xyeMrRazuh9fYqB2YxmTQzt/T0/bW7ExPjDXc0FIsdHqqMLO+Wc8?=
 =?us-ascii?Q?EZSjxvJ7pQ1N50AnUNOh80GKRlUuhqXIPAvLStx2enk1bzkfgdy48FZc/CFk?=
 =?us-ascii?Q?DM/hP+bnwfg0IhsZ7nIbTRFfiHJynCR6vp4hvaN/c/NPqcUPDJG7iMU3ch/M?=
 =?us-ascii?Q?hAWq7Io5Foe29tYNZtK2UvFmWiVpL+ynj8lF06rE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188a270f-7c59-47c6-ad71-08dba536cbc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 06:44:56.8425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXWxrAB6dR8aC9d6ID0iakRlHXUw3URQ/pVeuF2Sapu6lqru7KspnyPXWdgrFoe7fdNoQ3e5ez9zaDL5et4Hgs3NwPnulKWeka4boz62VZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10077
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channe=
ls
> in struct tmp51x_data
>=20
> On Thu, Aug 24, 2023 at 09:44:56PM +0100, Biju Das wrote:
> > The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> > using tmp51x_ids for this HW difference by replacing
> > tmp51x_ids->max_channels in struct tmp51x_data and drop
>=20
> You don't replace it, you replaced "id" by it.
 You are correct "id->max_channels"

>=20
> > enum tmp51x_ids as there is no user.
>=20
> ...
>=20
> > +#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a) - 1,
> > +11))
>=20
> This seems fragile ("a" can't be 0, and can't be > 4) and will give not
> good code generation (for GENMASK() use), besides it has 0x8780 magic. Wh=
at
> is that?
> Two bit field masks?
>=20
> 	(BIT(15) | (GENMASK((a) - 1, 0) << 11) | GENMASK(10, 7))
>=20
> ?

Looks good to me.

>=20
> Also add a comment to explain "a" and other bits.

I don't have access to user manual to explain these bits.
May be Guenter/Eric can help on this.

>=20
> ...
>=20
> >  	case hwmon_temp:
> > -		if (data->id =3D=3D tmp512 && channel =3D=3D 3)
> > +		if (data->max_channels =3D=3D channel)
>=20
> This is not the same as it was previously. And looks like this kind of fi=
x
> (if I understood the previous patch correctly) should be done there.

Logic wise it checks for invalid channels. But newer logic
check for invalid channels for both tmp512 and tmp513.
compared to only for tmp512 in previous case. For me it looks
like an improvement.

You mean split this into 2.  First patch with just this logic (channel >=3D=
 data->max_channels) and keep data->id in remaining
Places and Second patch is to replace the id and use max_channels instead.

>=20
> Btw, avoid Yoda style
>=20
> 		if (channel =3D=3D data->max_channels)

OK, it should be (channel >=3D data->max_channels)

>=20
> >  			return 0;
>=20
> ...
>=20
> >  	ret =3D device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> > -					    (data->id =3D=3D tmp513) ? 3 : 2);
> > +					    data->max_channels - 1);
> >  	if (ret >=3D 0)
> > -		memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) ? 3 : 2);
> > +		memcpy(data->nfactor, nfactor, data->max_channels - 1);
>=20
> It looks like data->nfactor is of the same type as nfactor, right?
> Why this can't be simplified to just
>=20
> 	device_property_read_u32_array(dev, "ti,nfactor",
> 				       data->nfactor, data->max_channels - 1);

Yes, I think you are correct. The below code doesn't makes sense. I guess t=
his should be another patch.

	if (ret >=3D 0)
		memcpy(data->nfactor, nfactor, data->max_channels - 1);

>=20
> ...
>=20
> > -	data->temp_config =3D (data->id =3D=3D tmp513) ?
> > -			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
>=20
> Are those still being in use?

Nope. Will remove it.

Cheers,
Biju

>=20
> > +	data->temp_config =3D TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

