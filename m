Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A0578B43F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 17:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjH1PSn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 11:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjH1PSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 11:18:39 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69590EA;
        Mon, 28 Aug 2023 08:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUoWECCj7PdS+Q1DrrBayIgeNnpGTWpR7RMoEG2b7trVv/tUffqTQsMyYVdLHna/lD3wgfsCHdDz2RCOgg0h9mD0EgJHH+suJnLlHtyoJAD0jd+q3cvpn2A5bPkiAwAcqRmQING2HSH3z/BuqdTA11sdxbJn8TkTYxaxO9V2k8Li6YKwBocSO/crR34FX29dH0BUOkKFE07KBcIcBOGP2BCjQGuSYAZgEcWZTq450gGOLfWdpMYhAcrdkOBFF+tt+DkxtXahuYD69Nv4P+EHfgWlYX9sdTKSP2eSKj8uNQamyb0154aCv02jLkYoL1Eg7Ka1/BKo9FN+wuf5nCpn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3GfeAi6pllPPqCQvd0yOt3flk7woqn7FJHG4JftCK8=;
 b=OoDFE5fsowkeS/iMglQSACk1WmltSZeCXMOSYPRAeOppJK2qW3pbzV1eMApDKIEXkFymvCMtrijWrrFCDkLpwwlwAZjK8LoJW41EVxQ0BJaMJCm2DcXzBCQwk4/wldsnmH/d2aHHaOCWD5333fC+tdonu4JikQLEWBEYQx0gGQVtitpCGf9Mtg5gaG5w6+Iv+aS1C11aj6wgWVszcG73dq+ef4IH0Pr8iRxlaP5A65gURDHTwzBM6/gBlwE9s8WtMEaTl7pUvoue6z1v15pt8A6Avk3xMmbYnq1IwKEAmusZy1Edg0idXk0udb/8DYiK/9hn0+v5Y2OhPn13eF4wCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3GfeAi6pllPPqCQvd0yOt3flk7woqn7FJHG4JftCK8=;
 b=rld0yAVrPnf6a3Q/Hv/izSab9VgOgwu+L7L4pFjUzemCnKTEMGV2hrYL4aqyUxInNtEWKFjJUyIkpt3N9KC+aTw94+QFerem8Q36rSjKwks6q5eBOoEBUuIIcdVp/0ZCcdr7ggBqWLrUkVqnZ8V6ei/WcL81fQsq1MCH8JyPCb0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9636.jpnprd01.prod.outlook.com (2603:1096:604:1cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Mon, 28 Aug
 2023 15:18:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 15:18:31 +0000
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
Thread-Index: AQHZ15ZGKi8tWd8hHEWtnctHOBklta//0kwAgAADN4A=
Date:   Mon, 28 Aug 2023 15:18:31 +0000
Message-ID: <OS0PR01MB5922A9FB53ACEA51E981E9DD86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
 <01b19c73-d158-401b-8a0b-3fdef61294c0@roeck-us.net>
In-Reply-To: <01b19c73-d158-401b-8a0b-3fdef61294c0@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9636:EE_
x-ms-office365-filtering-correlation-id: f74b6a19-ba43-4cb5-1de4-08dba7da0a18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W00OTFtNC8hRCNceKcvNQqMOVQIMTExHtXxnvDHf9H7Y+8vgkB4b2EbAQPJbpQLRw2+jfMkFzsf9JoUHRqn+OtHIti9IY6hzuL71Dd8ckD2aFOik7Y5PPYxoU1KWelffiENaLh/pLGD8wu4dl514lSdZgGUDG50iolk4kOXqoUCCoXk6NrL9TGBONVC47F1NA6zFZ43PwhAhzvtLt4PEXuFLDIwIeskl+E0dsNP4sCtDO4+n5p58MZuPR5go1GklJJ+AMiaJUtf/u2BHLHHgfo4pwyurrv/CJCciD+dzc+hNewQyNidhRsFjWPWKhCnrs/PLoEpNI+gHfZnRhKRtL/t95Mk33sZLt9kQhKwDLRcRBkWRsBPkTjOAnsglwVTS8lC9VYQ2ngvNh301klx1D3KpXfLWFO5XMIqrT2NRKTqvcRh1/ovohKtYXy3/aVRsHLyHQcJgL9R//gfITyUKFykSvNSAWVUrPJml1VYpdz7qN7pdTSiM6msELTu+0z/t5tG6h/mJZvmBVvLIFt2PGs8dxdrZ30PmHwDIZteQEKX/jXUNAPrj4sraUEBZBhGQga8HbPt3vufFAsGSfzhw/NNUMuH1cZzgqW2BQLlmAYg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(7696005)(71200400001)(9686003)(478600001)(83380400001)(26005)(2906002)(6916009)(316002)(54906003)(64756008)(66446008)(41300700001)(66476007)(66556008)(66946007)(76116006)(52536014)(5660300002)(4326008)(8676002)(8936002)(33656002)(55016003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Umgu4eyT4CV1xqasO6CoJxbJW8Z+KzYc52/7btu7K3anGhB46o0l4bjkUjL?=
 =?us-ascii?Q?RS9W2p8HIiwuPaAeye+V3IZl8dqIlSQbRxRnTN8Cj76uESsiKVs0+HGHL+Qd?=
 =?us-ascii?Q?FrOC99SybjCcE7zx4yUx6ajqIW+AZFHWcpS6Oa21+e4fXoHUnUvjbuixL+Hl?=
 =?us-ascii?Q?Kx6gwYD4RpVKfUZey6lLVYA0Ln54Bez5tMd00kPLoDs5PXVGs5rP2L9A295B?=
 =?us-ascii?Q?pZren5/FAFtVCRaaJW+g9FnknSv4zHHBPHGtl2HmWnWRtQFHcXLbU3nlENqy?=
 =?us-ascii?Q?LG6OQSmFMuhS35UAA2C0IuWwFqiBwea1NPkZUtttzkQX6lsHlKhWWU28x+vf?=
 =?us-ascii?Q?qBV4tMwEkAKzSKn0EZifBRXQApvXh8MPDAKmtqby4RqxswLvwKTnrYUTdGNU?=
 =?us-ascii?Q?p3tLsg5EdANBRzpKY2w5ojPAh6gAx7tSeRXWvqfk8T98cvcZQBJlu1Qu1iSY?=
 =?us-ascii?Q?fcCYEc1wYtqoszL887ebTy+bX4Rj6DA5qwfXIcxpKlv4kM9o9zSepjEXzbUR?=
 =?us-ascii?Q?JNeWBVEvmHxbYwmAhWAcd9Ew9qUgDEOVTKYF3IryqbF/Gy20Jl4i4vEs4w0g?=
 =?us-ascii?Q?hbW/q70h6PsvmNpKfzIl+8TFIKWzioPQAyUL1Cg6uLC+U9RJiOeKlT/8/7Gx?=
 =?us-ascii?Q?Z9+fpG0TzSm6KSnOSPxhUl32v8iR9cY5ozKBP6TaU+2geJLnzMZUs9+f+m7K?=
 =?us-ascii?Q?kJcDibsweCqMMRFEp+rox/5Cfupkf5aCyM8u6gR84lGJM/Po4xk26hvRrYnT?=
 =?us-ascii?Q?VWD5/IrwHROBw4hdMtvlcQDiJ+R8cCH2gsjnQsPFzXGWhOIcwd8y1j+IJRgt?=
 =?us-ascii?Q?5LPH4YWakbHNpaDp9TECYkzVfLFA/UoQd++Tq+plniYTb8kUhmcIZyg5dS4Z?=
 =?us-ascii?Q?FeSRVrBUrAwdyI/jUox2gQYLp9CBOR1lMYuRXBUxDBstnZ+YDy9EGlZjCytg?=
 =?us-ascii?Q?CHVTfyWqI5nUIO71kaQdhYM/5JYv72b5qICjo73aZKuLNHGUQFoi4D3J6ddw?=
 =?us-ascii?Q?XJRZfirmq6QeuL8dHcqXZkUySVwbfL2CndgUHOHYjFaYyTPNuLDSaueIg1PH?=
 =?us-ascii?Q?yhs4le0nqUogoWQQqBdTNNTlgvH0HV8jwPX34/kYVSAaCIfZNYaM/kwaGR/t?=
 =?us-ascii?Q?An1aBE/voDMjuyV8yfDTw2/d9RshdmNiD91kHs/1DH5HHLiqBhOYoiq+ObMn?=
 =?us-ascii?Q?lEGMveFijhMJzIAHlmXvYie1uKFa2dAoiUoC773Je3Dga7pIQunur0I9dfdk?=
 =?us-ascii?Q?r5lHxn3GJ8aSg2mrWmZvAjE6rJGmf7MNlIrNiQTmBNpM3wpyJAfFScjF9Xqa?=
 =?us-ascii?Q?rxCC41K0X7GSmEfhfLYRbMtAwW69yfLScALjggHY84IdQskSDlQDRkrSVj5x?=
 =?us-ascii?Q?JnT5Lc8EYptuKzK+k9htsqx6mzGd74J98z0PZ4RYSR6xCR5cLcAsBTyHwvBS?=
 =?us-ascii?Q?Ko0H/MQVKqVV5FVW1aEQ5BpQvGmlVcM0DFqgso1s3e0/9p6lxo3GOtsEE/7h?=
 =?us-ascii?Q?89sfwFm3aaslZ3i2xeOUlzB0YyIEzQqT/C2zgBLFuOGtzUYQu9qN4aiUVwdd?=
 =?us-ascii?Q?mlTZZxaoc7ODHARE2KiIWHV4oTyVTk2kSpjune/qwr1dR1js81HJwFr3h10g?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74b6a19-ba43-4cb5-1de4-08dba7da0a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 15:18:31.7012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wlb3mRjr5AtzythlfpckzDOc/xCvL765Xz3PC3zKNzKzGIPdRA8KLnxAvY6zzRg9dJMU0l+MPgB2lyoq6NB2IWagTTDeN2KD1tSWlIibvJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9636
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
>=20
> [ ... ]
>=20
> I had another look at those. First of all, using MASK and FIELD_PREP for
> single-bit fields doesn't add value. Just drop the _MASK from all those a=
nd
> just use BIT().

OK.

>=20
> > +#define TMP51X_TEMP_CONFIG_GPM_MASK	BIT(2)
>=20
> GPM is bit 0 and 1, so this is wrong. This should probably be
> TMP51X_TEMP_CONFIG_GP which is bit 2. It is also a read-only value, so
> setting it is never warranted.

OK, will drop this.

>=20
> > +#define TMP51X_TEMP_CONFIG_RC_MASK	BIT(10)
> > +#define TMP51X_TEMP_CONFIG_CONT_MASK	BIT(15)
>=20
> Drop _MASK.

OK.

>=20
> > +
> > +#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)
>=20
> Technically, using a 2-bit field here is misleading, since bit 1 defines =
if
> the gpio bit is an input or output, and bit 0 defines the state of the pi=
n
> if it is an output.  This would have to change if and when gpio support i=
s
> added to the driver, so it is best to not define anything GP related in t=
he
> first place.

OK.

>=20
> > +#define TMP51X_TEMP_CONFIG_GP
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)
> > +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
> > +#define TMP51X_TEMP_CONFIG_RC
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)
>=20
> Those are really the values to be put into the configuration register,
> which I find is just confusing. But define the register bits, set the bit
> if needed, and otherwise keep it alone.

OK.

>=20
> > +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11),
> GENMASK(n, 0) > 1)
>=20
> This is wrong. Either s/>/>>/ or GENMASK((n) - 1, 0). I personally prefer
> the latter since I find it easier to understand.

Agreed, there is a mistake, your suggestion is good.

>=20
> > +#define TMP51X_TEMP_CONFIG_CONT
> 	FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)
> > +
> > +#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
> > +			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
> > +			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC |
> \
> > +			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)
> > +
>=20
> I would very much prefer something like
>=20
> #define TMP51X_TEMP_CONFIG_DEFAULT(n)	(TMP51X_TEMP_CONFIG_CONT | \
> 			TMP51X_TEMP_CHANNEL_MASK(n) \
> 			TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC)
>=20
> and drop the unnecessary complexity of defining single bit values with
> FIELD_PREP().

OK.

Cheers,
Biju
