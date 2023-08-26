Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D12789411
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 08:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjHZGdX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 02:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjHZGcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 02:32:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E0CB0;
        Fri, 25 Aug 2023 23:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE3pB8Gny3TaWA5p8Vyx1Jqp/lnTraWDRIGuU0Ir+fVBISNThgwaoI+/7Z3IPw2U+tn9bVK4j3wcc6FSkaJgUvPX9iPE/VKn52+W7GO0LZD9hB7b+kwHWTRQd12eJ5oIgBRe0mA2yCFhp4LNUpTUc5hKfZjKiXOp98buZkarQ7RD3eMBY292kkGFNkvc0zj8yQGFUAyxb82SDjspvvv8eWq/M4M2N2eoCRw4LrOnhqkQgO5FmThIEi0q9EKHPN9+epTrf8Dz9F02cNd8t2Xa84YV9WvS3uTK1iHftgkxgz8oP2EXLr5Cbm4Ht6VF9/t/HRr+JsgREe5OCrZJwpRpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqmlZ/yU5e8l6sBxMa9U2PiJN+H3Xk8btqnhtw5zPTI=;
 b=kfatnV3XAFg/OmunLH2ogmpDfcD39Q6mqHPvJMshh/KNrkwKeyTBiXXRLPDbK+8pd6sI44GBxb7+SfwhKNwDKgKxeo5v8WY5QFoc/7QWjyxVWeS2HOSjWLR89GaU40QJptMFs7FJ17JQhz89gezKUzgA86nxlfTTnwMSPYENZhOHkYDMndjzsDYU54++EyN0sA3xwmzKbK5kBwcqSkYOiHQB20FoxCiKlPIR7+qDWMXAuXRznhWQ95VerlKyLwSWw9KFqOgjg2kwShMM1RJzp8I333/AjvnDQwrnMlfYXml5Fy7oRxel3vjJpu/riTIUOH3rHAP9imAb0ei/JhISIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqmlZ/yU5e8l6sBxMa9U2PiJN+H3Xk8btqnhtw5zPTI=;
 b=sWNUpqgqTcY/jjY9iI8cdRhhsWKljkMS4A+gDm9vv3oQrzc2phXGf31IxbzaxfLNo++m4klyaz92d4I08CuCegbrUPODLFNwR1NT7ltCbykHoVoIOLNZHzmbOulZvZmq1L/Jy8JrmORZOWb4ef5uKDQI34+bqe80JHG+9Lcqp7g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11674.jpnprd01.prod.outlook.com (2603:1096:400:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sat, 26 Aug
 2023 06:32:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Sat, 26 Aug 2023
 06:32:44 +0000
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
Subject: RE: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable
 id from struct tmp51x_data
Thread-Topic: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable
 id from struct tmp51x_data
Thread-Index: AQHZ15ZGKi8tWd8hHEWtnctHOBklta/71MOAgABJi9A=
Date:   Sat, 26 Aug 2023 06:32:44 +0000
Message-ID: <OS0PR01MB59226E0BF852F778D2B0B9E686E2A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
 <5d7b4ef3-1331-4e34-97c3-4c6832e215fc@roeck-us.net>
In-Reply-To: <5d7b4ef3-1331-4e34-97c3-4c6832e215fc@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11674:EE_
x-ms-office365-filtering-correlation-id: 6276b96e-636c-419f-3831-08dba5fe41dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7aacdeWzjGX6QuAeK35ML1QzKJ5eH0jIk5LIPkJ/5AXKSHN1zvU9t1vb+GoOlWPID/R+A2bacFGvDkaNW+5szl2UzGfuzkV3Fdyxb1/XNMcV9IFibqmxwcexr7C4aSVyCMnYxu85E3faNv4OwRVjWj2ZL86aYjRfKp3zJ3ru31iIgY+zINfkuUP3y5QOM23aV5NuwEHmuTkClEi6+J93Pa9xPPn2THMznBkckrinUCxgkeAULlYIcCj0Jamk8qKBMu0VUUBIqXxRjGY3IcU+aYATPIponne4gv6O6z31Ap7I6z4DkEyOgvlxG8ydggjNaYntjsrFjRwfJI6l7nPNLKuysvJwGVJsiGcm58rsL3C1p2/DNhYCBYfd3MAEx9qHnP88PLoQCoG+/c2G+J+b9BjDJiMD0AHtt0itmKQ4LyqJe1MKvgabrAnSP1iJ4w6Gl4zB6j/LmxpODyS2lpMbCBTzCaUJ9iSYosbyxAKCAsnXpJrVouzyBIWLAiJvWYLG2bOzYPYwna7mwkLO75DvAaYE/7AHmd1GukVmV3cbp3XsRsXkq03xr1AyK/96BovyYC4OMXBYKjdMaFc/BL6MLL+yn3GkATh/rze6gdbbGha+rJY0NHvk/7r1RL3xu6GMaVu0M2m2RUan/4bBKR6xdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(1800799009)(451199024)(186009)(71200400001)(6506007)(7696005)(33656002)(86362001)(38100700002)(38070700005)(122000001)(55016003)(83380400001)(2906002)(26005)(9686003)(478600001)(76116006)(66556008)(52536014)(66476007)(66946007)(8676002)(4326008)(8936002)(5660300002)(41300700001)(6916009)(66446008)(316002)(64756008)(54906003)(2004002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HyGj9yYHse4bHFsufPp7Jz/7yNbNULy9I5UPoyAhNZMKL9ZBsy99ZAey+5/D?=
 =?us-ascii?Q?gsxIVw3aAGimPBan8c1HtVuAIWutI5uPBiAIYv3zd5ILGHb4WS81JYp/BK11?=
 =?us-ascii?Q?6oHCspdHZWkcT+56F2RuvKRNhAM+i73zSI8i2/WtpNRGRjF/FDi2QuVS0o6w?=
 =?us-ascii?Q?hAiNSpv6P5Gam82NRHPJs6hGf3Hl6mnqekUZ6mhjjQR86/T1p6udZ8g6JdBY?=
 =?us-ascii?Q?76mYTk0VBu/Ymu/YILc/TlrT1QGVZrDWMVab7YvRv8GOJ6hOzxUoiYJl6Z7v?=
 =?us-ascii?Q?xYAEOaJ+cK1Ffe+cKV46aNtMaWRo+xfKHwjSe+l3/sf/6DkwVkp+000Te/vG?=
 =?us-ascii?Q?YL+hhTWAWOt+4D7ppJjPS0ooTUwWnMExVR+Efayzp5GzOGpO4ZjyhpefidrA?=
 =?us-ascii?Q?4IwUbyE8wACjIvHMkKD9RrjJ2WjMBy98svU9esXcIH4fXhpPck41ltnmyecW?=
 =?us-ascii?Q?W7fWwfYN+S0Zpnx8Jv/OMnHDJncZ8Cdbo6/DTwAJaGCZgHv7n7qPiBru8hBo?=
 =?us-ascii?Q?wn0eVistP8EekQTE/WotngPDcfU2rDUgkmprtubuvKyZZtJ/L6r1YkB61eCj?=
 =?us-ascii?Q?d1HuV1W7wBVr4YrapvE1vBSK5JDCz+8kolpZjofimvkclnjGBxfhxh8cUdh5?=
 =?us-ascii?Q?zYt6ifHtHVAbyzjgjSCcCF/3yafFbJQ/0/fZiedxonTl1YtPilJWzUZwegS1?=
 =?us-ascii?Q?XDXmZG2VNKFmo8KTJX4IvLMuqiJ9tE4QCOxnHP4ZOi3DlK+keEEoriZcKDyO?=
 =?us-ascii?Q?T+2MF2VIxu+xa9jPVgxej0BiwZ6U85ZwmiOfV3AnNM4Y4p1Infe7e/ydR++J?=
 =?us-ascii?Q?Ney0qb2Jal8P3D8y3e8ZQK1zFUwtXM/uP7lUTpqLS7SP9GxP7ZoiP33neqSq?=
 =?us-ascii?Q?Jz9xDWnpzjKF7UI892ZI99rOFvwO6bPFL2NhkxVqxQdWcKPatVpuvsNnj9dL?=
 =?us-ascii?Q?qwJBibp2De3pqcF9K9Puj8RsOlApwhiEopwja6eaDpbteKNHB4NX4NtgJAWq?=
 =?us-ascii?Q?6MblANq3RD2XIeRCjEPmKyUSr8HF6JXH8aB5qQAz+hHB3WcZBg15fvbHd9YI?=
 =?us-ascii?Q?jO0Z0AAbQNl3SDK+1yik0JMHLSmozbvykLNY1tV4vE22uLrfthMm/FJlfVSZ?=
 =?us-ascii?Q?1mUPg6rgXcRVUnHI63YtDZtGbs/JKOd59OXitz1eplaZKPkE0MYLy7Qv/8Ym?=
 =?us-ascii?Q?iB0tAQByUaRk9hU8yDNbOYPiDd/9a9m4utEYx558OZK0IKyh/jIcsvNWoBU4?=
 =?us-ascii?Q?EpoxvPDqFJ7qB4YkgCmWZuX7DPHBcEUr70S7YjaCcJ4EEYJm9FF+EkyTjXQd?=
 =?us-ascii?Q?aVmw1OjnAJUXZsyzR047zF/YbHWZnStNTshB0fE/s0c29OAUxV0jPcN9Tha+?=
 =?us-ascii?Q?wkOOQ4CvDK3BfjppLMd3aYHr/obLUQ29yTE3jwMANjP2MhssVIL4fwv74HRy?=
 =?us-ascii?Q?zvLtGqXmwrNc+Wof5fUffzp4BsWzwxVS883N6U058zPtogqehgcSKsUgzyd4?=
 =?us-ascii?Q?lKWdYgV/MbxSHxYtEI/pqKpibWXHhMR1ej9WmBuhnw/2GjZKNK7ltnzwtXzy?=
 =?us-ascii?Q?siPJmpf+YnWdSupHZtO5fOsoELsIF5e5WWkqAjly?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6276b96e-636c-419f-3831-08dba5fe41dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2023 06:32:44.7768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adWwY1nc+jNVxsyUT4mEU4j43BwdL4p6DZn+5V1m5I1s43C3fI4oW4Xf9ABpesik3OstnO090rX754HgZlFV/iD7edy5+I9tMZ4WBfMH1Wo=
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

> Subject: Re: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and
> variable id from struct tmp51x_data
>=20
> On Fri, Aug 25, 2023 at 09:53:44PM +0100, Biju Das wrote:
> > Drop variable id from struct tmp51x_data and enum tmp51x_ids as all
> > the hw differences can be handled by max_channels.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Updated the macro TMP51X_TEMP_CONFIG_DEFAULT by adding bit
> definitions.
> >  * Dropped unused macros TMP51{2,3}_TEMP_CONFIG_DEFAULT.
> > ---
> >  drivers/hwmon/tmp513.c | 38 +++++++++++++++++++++-----------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c index
> > 99f66f9d5f19..6bbae4735a4b 100644
> > --- a/drivers/hwmon/tmp513.c
> > +++ b/drivers/hwmon/tmp513.c
> > @@ -19,6 +19,7 @@
> >   * the Free Software Foundation; version 2 of the License.
> >   */
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/i2c.h>
> > @@ -73,9 +74,6 @@
> >  #define TMP51X_PGA_DEFAULT		8
> >  #define TMP51X_MAX_REGISTER_ADDR	0xFF
> >
> > -#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
> > -#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
> > -
> >  // Mask and shift
> >  #define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
> >  #define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
> > @@ -116,6 +114,22 @@
> >  #define TMP512_MAX_CHANNELS		3
> >  #define TMP513_MAX_CHANNELS		4
> >
> > +#define TMP51X_TEMP_CONFIG_GPM_MASK	BIT(2)
> > +#define TMP51X_TEMP_CONFIG_RC_MASK	BIT(10)
> > +#define TMP51X_TEMP_CONFIG_CONT_MASK	BIT(15)
> > +
> > +#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)
> > +#define TMP51X_TEMP_CONFIG_GP
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)
> > +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
> > +#define TMP51X_TEMP_CONFIG_RC
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)
> > +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11),
> GENMASK(n, 0) > 1)
> > +#define TMP51X_TEMP_CONFIG_CONT
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)
> > +
> > +#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
> > +			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
> > +			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC |
> \
> > +			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)
> > +
> >  static const u8 TMP51X_TEMP_INPUT[4] =3D {
> >  	TMP51X_LOCAL_TEMP_RESULT,
> >  	TMP51X_REMOTE_TEMP_RESULT_1,
> > @@ -155,10 +169,6 @@ static struct regmap_config tmp51x_regmap_config =
=3D {
> >  	.max_register =3D TMP51X_MAX_REGISTER_ADDR,  };
> >
> > -enum tmp51x_ids {
> > -	tmp512, tmp513
> > -};
> > -
> >  struct tmp51x_data {
> >  	u16 shunt_config;
> >  	u16 pga_gain;
> > @@ -172,7 +182,6 @@ struct tmp51x_data {
> >  	u32 curr_lsb_ua;
> >  	u32 pwr_lsb_uw;
> >
> > -	enum tmp51x_ids id;
> >  	u8 max_channels;
> >  	struct regmap *regmap;
> >  };
> > @@ -589,7 +598,7 @@ static int tmp51x_init(struct tmp51x_data *data)
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	if (data->id =3D=3D tmp513) {
> > +	if (data->max_channels =3D=3D TMP513_MAX_CHANNELS) {
> >  		ret =3D regmap_write(data->regmap, TMP513_N_FACTOR_3,
> >  				   data->nfactor[2] << 8);
> >  		if (ret < 0)
> > @@ -672,9 +681,9 @@ static int tmp51x_read_properties(struct device *de=
v,
> struct tmp51x_data *data)
> >  		return ret;
> >
> >  	ret =3D device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> > -					    (data->id =3D=3D tmp513) ? 3 : 2);
> > +					    data->max_channels - 1);
> >  	if (ret >=3D 0)
> > -		memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) ? 3 : 2);
> > +		memcpy(data->nfactor, nfactor, data->max_channels - 1);
> >
> >  	// Check if shunt value is compatible with pga-gain
> >  	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) { @@
> > -696,8 +705,7 @@ static void tmp51x_use_default(struct tmp51x_data
> > *data)  static int tmp51x_configure(struct device *dev, struct
> > tmp51x_data *data)  {
> >  	data->shunt_config =3D TMP51X_SHUNT_CONFIG_DEFAULT;
> > -	data->temp_config =3D (data->id =3D=3D tmp513) ?
> > -			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
> > +	data->temp_config =3D TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
> >
> >  	if (dev->of_node)
> >  		return tmp51x_read_properties(dev, data); @@ -719,10 +727,6 @@
> > static int tmp51x_probe(struct i2c_client *client)
> >  		return -ENOMEM;
> >
> >  	data->max_channels =3D (uintptr_t)i2c_get_match_data(client);
> > -	if (data->max_channels =3D=3D TMP513_MAX_CHANNELS)
> > -		data->id =3D tmp513;
> > -	else
> > -		data->id =3D tmp512;
> >
>=20
> See, hat is exactly what I wanted to avoid: The code above was introduced
> with the previous patch for the sole reason to be removed with this patch=
.
> On top of that, you introduced a bogus "fix" in the previous patch which
> doesn't fix anything and is at the very least misleading.
>=20
> So, if I accept this series, I'll combine those two patches back together=
.

OK, Thank you for merging those two patches together.

Cheers,
Biju
