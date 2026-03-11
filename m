Return-Path: <linux-renesas-soc+bounces-29187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJucIwc1sWm0rwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:25:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396C2605C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2251D3030EF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9AD3CEB9D;
	Wed, 11 Mar 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PUzWYOkI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4E3CEBBF;
	Wed, 11 Mar 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220803; cv=fail; b=nbT2cKAtpIZ5UPwgtNRknKy8Wqg5kwcwZumBi7Q3YI9woWgxlYcoJEm9ONMOu1gNllwplX8YiPkr2DLavyCqDWVRA3o/qlqAK5nbrpmDEBZ9CXJSDZ0uvB6rCYGdAfkBvUOZdf2R8Su09zFK5G9vr+U2mDh4hip4Huwx4DK7xmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220803; c=relaxed/simple;
	bh=tdvFXuoJbG1idwrCafhqG0ZZ2ryZjbqpXuFjVibKPWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E28I8jtCSwPXQmF6mTTCXiWMFTtE9S2/s8qGBKX56w2KO0a3+yrfVMOjcVU0QFXlAmvYomuiuhUXxnTCRDPi2nXxJ0ToRI0YoO2HqxrkBqE5YPHEoISoygY/hca9bzguTLTsyt1tDcm1p/9d7sQNtr+Jx7JyOpoo6IYpwNIyJis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PUzWYOkI; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekVv9Z/MFTjW2rADc84DBVxxnQtgHTMVs33+NG3wxfXWHj28Mq/3j0+DEv5NSBjPfWu8ySs45mRcnw4dfgAO7sp4uWiaizHfM0dTIweZPKdhrEo2DDwqaswFMfJcsCokxpVWADwY9hFB9nJYB7S1+qbyKVug9shs/wt4Bis/6Bh+sextQ4ZCXJ21C5B/SksWf/wG3Z36hfgfJcR7HWyD4mM5ne2CjBk6jon+LX/nd3oaKZt7xBbWy7MdldqdtPSqZa2rY4CHUNQ3wT3VGxDfAamKY1Im13okndQfy9p59OSL0NWM1j5hnrxtOtS2LelHlIjI1mpufTADhfOn01a2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEdvpJWiS3jp7xzpi+YCyjClVw9sfKW+YCjjSEiQsG4=;
 b=D2ZL3cihAXjYHaYQUZTntqJGnJUWUVYFA7R87kXovIOJ/pm2Nh1s+ap6zHi4oZ1nC81IUx8qlW9Lie+fEfyfbUdFwj7Pe8bE+cHNztHJhbktQ7hMbMTJ3dL6oEYJ2Z/jQerJswumRp9B7+ojBJBab6ODXrQ74oq3YbNu2fn3jSoNLm5Suq9bVhe1jR+JhmL4WbHPYh9FnDP7CQFt+gOISlt08xzJlF4iCfxPfwQg0G6R3sQh69qAwvMlXy95mWzSOQ8ECftrtsJgyL4FuxvH3jsTsoAIyoZ2BAKHrdStWNc8YKG6NHYJAi5kuQWLicVxg1eowSmzaZ79DDsLb//jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEdvpJWiS3jp7xzpi+YCyjClVw9sfKW+YCjjSEiQsG4=;
 b=PUzWYOkIoULQmDc6HrEF4W6Rh5fy94F4oxGJynsIxWQ/pE9nC7i0tP9n0bolz6RVaTektXlJYAEnBTSatWPzrcG5OigxU94HR4OY7HzJeOElsTbJIyfF41Q+aBHKG9s+cLpmvZBhfcW/0fXHYn+ahUz1zdj7zGymRy/ZrDuTpCM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13813.jpnprd01.prod.outlook.com (2603:1096:604:36a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:19:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:19:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Thread-Topic: [PATCH v4 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Thread-Index: AQHcp/HaAfthB9Q+uE+v7B/fVrvONbWpHNMAgAABQuA=
Date: Wed, 11 Mar 2026 09:19:39 +0000
Message-ID:
 <TY3PR01MB11346D3375A08C25DC9E2FFBD8647A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
 <20260227140316.308106-5-biju.das.jz@bp.renesas.com> <87jyvirazp.ffs@tglx>
In-Reply-To: <87jyvirazp.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13813:EE_
x-ms-office365-filtering-correlation-id: 795ab950-fc43-4b6b-22ef-08de7f4f5247
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 uJ7k7CS0PvABhSPR3u3LwdbGyBwRx4npN8qcs+XOpn7P+ka0qO85evxCy7IdlF53h1tsOxRypw5JIGSdtRcgwbMH2vcXo5eba1fuPh9E5T9vPiJSyaKWY/4YIg+cWaZvaiu5RmcMhRlfKqJSPAFLGiHQIvxyh3bqO7Z1eULhvxEetSJQpTTvCoRPKcWErenAJaZaXvIZ+lPAj+gmU3j28dHUgwF2emj+iBjbL5Zh2YMx5ua1Al5HBBfeglPbcLm7fs5zXbMtdmGmvcUyIyKGY/YAkn6xQJbVl/Za/vGOUD3lw9cbRie3SO6hgblN/ZeBwJzu9s/trPkwrN6ZaP2OVMw6yhTnsC7sGNQW2c51PUaVUXH7soG0Ka6bL+tawJPHeJHOOSkR7DjCr98tdKSnjy0SMrjDfzYIkUzNpkPWmUb0ibBVg2hA5dDvceylDP4rvnAIw/iupiUeaxJfSNnfEi+FtQGbo4kIaEZMAAR9gxdzr1pJXcCCduZRvbMQKhn4ifINIWVvslrAhsCakpNfsqytXDsL7tAu8j2qyYsp+AS5kIYaN5PXiiYbRlTo+twlTp7esM2Rlohw0hQ3+eUXhkyrJeCOAaHNw3zutVfehAN5VCXguUtGAgz6Yms7SeP1t1YZ97W6FRFevXmPoRpSg3RcJKbS8p07VCtdTjWauC6s6XLAyIEMdsgj4JxAqadcWNldCnNYN3RCwQoxt7JlAahti7lP0OirBxzfWIzvmX75shbGrR0m19SGEhRx6RUwZILoHjgitDBzyiYGCR4WEF54pFWiBcIBwG7A6IHR2e0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sv5z7/T4A6rh2dz6QZO7UVUb4LsKhNFjxpPeYsj6ekbErQfGL4lvJuy1zCVo?=
 =?us-ascii?Q?4yYTemM6LFtgHsxwEr+7ErLZp57h5ix2c4iVspmBAOBtAMGIh60ERxwawKHn?=
 =?us-ascii?Q?+QXjyT4OCEINmiJRs60TI7N+LrsWK4DJdsBQjDqKFuijRVPREZao2RTR2VJj?=
 =?us-ascii?Q?fRziQ9ALtk0eSgfXZXGtZACvJ3WK1yy1hg0Fp28eIf/prc4h/ueYPJgI75Gt?=
 =?us-ascii?Q?Ehx41rltBeVCrfzhw6qPl0X6ONrPn5GPEeOQa+8P6yikpMfW5jONiL8U/T9b?=
 =?us-ascii?Q?m52C59yr7PVOjI6tWCQGtjQTtbygAyjyzNS3bSYZ9AY42aKgZYB2k8FqYl30?=
 =?us-ascii?Q?5sC2968dPwPilrGgGjqcYw4wlMIlKRHRCHvjVUVqg4IUy0rYw88udAJcWgow?=
 =?us-ascii?Q?+T93mq88wq+PK5EUWWbVWhC12B67PkYil91PHOlwVncYi+UR/nYbhcyjtiJn?=
 =?us-ascii?Q?F3GDAr6yJGKo8xMURPDifFj+U5A8UwG/S1MdEuFmbMXzAYm1+pyr9QyRkBmE?=
 =?us-ascii?Q?gtzxaFdnln3Wi7s4YTFBlQZbBm3AdUvExlP8Zm4ZGPXZ+0FpKKV27hxODyPk?=
 =?us-ascii?Q?KLhmQVrNOuzxIiOSflLlzxJ4DF2/nESTHcRTz0dWYIT+zRfmhM9JqIPwlp5F?=
 =?us-ascii?Q?/DiwJIoA8CY3itV1ggwrZOU1qn8cLzhB8w6em/ycPVdU+GP+CFRY9XokSkjO?=
 =?us-ascii?Q?SnnKOSb6IyzMJHIMK+m7uuBVVUhe0ZGhJvaE19B3XTW6Qa0Ct1Sj5PSsMM7t?=
 =?us-ascii?Q?J0/TUyW/rVdSiV7H1SDYyDDITcLFaOk38zcREApSbXpd7wcWk072sjyGL2ix?=
 =?us-ascii?Q?XnQpYh+fBRpjE8k5z6W3ybPcNOHDJmVJ3GyRlmtYQKi5eh+8uBwFLr1cUfZr?=
 =?us-ascii?Q?cy7DOiEL8okct8zjS+9mFiW91/6sxfncOQunYNMfDxTFpn8l/V2tRR7yLyF5?=
 =?us-ascii?Q?9XnLA3ct67x0obZbUPJrL4TcCGB2J4uiQlWWgduV22iQbP/+Jag/0pDqNduV?=
 =?us-ascii?Q?hanzjPSTP6Q2672XuxIuycfKeCE4XtDzZ53q03By2UzNbO7RGALpX6i46Ohk?=
 =?us-ascii?Q?Pm1MWuIWCMM+gKW3QSqAwboa0XwPyxFICdK3FPPNTFdjQCV0TcnzHEogfK28?=
 =?us-ascii?Q?eqKHK0ih4ElZhrTA9i5hbkPfksMh7TTqZOYv3ByvDXN5W7ZkfUkPbisMuQj9?=
 =?us-ascii?Q?16rAVOweYKdSugujri/ynfIeupcOcGQza2AEJ4/v2XkftY7ONJHfnceq95sN?=
 =?us-ascii?Q?SakChvpVkfwA8wCkqQ3exeS2x2x/2MBW2nRzBzX9itBMcf8A/TsRMtSku0Am?=
 =?us-ascii?Q?HVN+6BN0jxcFQra7cODhFF8AL/D+5tBROSAn54BXClBvGngvW67z51pu/GrQ?=
 =?us-ascii?Q?bagc0+mK+NdklYg91uacPZVpZPV+LsC3kDw4S/K9cwLa0N+rLiPD77Ppp05a?=
 =?us-ascii?Q?Ipu3xDBy1Gq+WLPKNNnQAzK1PbFreWet2gTBaiNid58xPa/6QVZU4FZqx8Vb?=
 =?us-ascii?Q?BFv6yQdf6dTysNbz/iTTB3tuq/q2q0UC4OMHfHtNxahvAXNwKD5mWYXwjrEU?=
 =?us-ascii?Q?zK3hBYhiR5H6xnX38pKp7ZIMkT3q0RlWGZJxUnSUa8CSvnHMFX9mGi/x14DH?=
 =?us-ascii?Q?weomqvLTdHRa6iGJ8UrfhcWDcd60awbm+PoEc1oq2oWfUIQXPcFnx7+l6PeU?=
 =?us-ascii?Q?81ZvA3ooAH1Ejen8BM9IOcsxFuIr+U+B2oGk43MWDxJbT0iqVD9vpIG1gLcK?=
 =?us-ascii?Q?dOXl25I2ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795ab950-fc43-4b6b-22ef-08de7f4f5247
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:19:39.2132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/SNlJD2cOajZFUjo80ZCrugUZ1vPfdS2NuMihlsp2i+5rfQuyTejm5xPhyoJZtDaf+SLnHd93At9tMUsFO/KRwaVu7BR0oEByR4faiUc2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13813
X-Rspamd-Queue-Id: 9396C2605C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29187-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Hi Thomas Gleixner,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 11 March 2026 09:07
> Subject: Re: [PATCH v4 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macr=
o
>=20
> On Fri, Feb 27 2026 at 14:03, Biju wrote:
> > @@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
> >  	raw_spin_lock(&priv->lock);
> >  	if (hw_irq >=3D IRQC_IRQ_START && hw_irq <=3D IRQC_IRQ_COUNT)
> >  		rzg2l_clear_irq_int(priv, hw_irq);
> > -	else if (hw_irq >=3D IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> > +	else if (hw_irq >=3D IRQC_TINT_START && hw_irq < priv->info.num_irq)
> >  		rzg2l_clear_tint_int(priv, hw_irq);
>=20
> As I pointed out in the review of the RZV2H driver:
>=20
>    https://lore.kernel.org/all/87ecmavbs0.ffs@tglx/
>=20
> this really begs for separate interrupt chips so that the decision is mad=
e at setup time and not at
> every interrupt delivery in the hotpath.
>=20
> Aren't you guys working together?

I have seen that comment. I agree, it is cleaner solution.

Thought of optimizing later after adding support for RZ/G3L??

Will investigate switching to separate interrupt chips.

Cheers,
Biju

