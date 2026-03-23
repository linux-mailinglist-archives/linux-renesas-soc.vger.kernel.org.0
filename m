Return-Path: <linux-renesas-soc+bounces-30113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABVkDmJswWlMTAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 17:37:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A02F878C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 17:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C447A3084E69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3AD32D45C;
	Mon, 23 Mar 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CZfks+XZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E371A23B1;
	Mon, 23 Mar 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277996; cv=fail; b=T+oh3EKzcHaOjMeWSiZCrgaSqPYXYZYZcaaITbjFSWxo4aUG7ldZlZaTr22Q864Ik/3eEI5vAHn9OOxCkig69bhSmObozyPFbX9DG4yzUHfxNdDqhwdB2zwoBBCNTCCj+lRYr5puBTi3fOV7yPL16OIqwfjkmFMbPaCfR3Tw9Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277996; c=relaxed/simple;
	bh=V0X5L0EMjEUWbhHcUs1AduJkbYFiDzcHkqiPDqfysLI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E08i1iQKcz1GANeOC9//DtRhqgDpHbMEd/+fE2zSyKBNlglDHJ58J/Gbs1j8Fnpsp3aypOggucfLukbo4gDF1iCSHCsMPzYtlIafNLUwHB8ejnUCGTZ1rDvXL+98v5QGPKcOG4gLn1pPas8RyiC4tmiFn3Y/d5f/V/l4Pn1WvwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CZfks+XZ; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA9E/tmo1GQ+wuvTwPJC0LiHP6s/E6Qv7/rmrp2uv6PMq1UxkgyZPy0qppE+878WuUMluYvIO0HSAduEoc4A8VUH1ddFiEfb9CM1c3ODNwmwFtCf8V+Lj1z4a3SnRDeCkafNW0x1wcYc/mcuq/GTHnbSgVLH16eDdOsNL4AfrwaFFBPsyKkXRJ1cd9dB0p6Op+4XYYMWeYa8WvH1REzGFxIFl58dQuK3c/1EJzD1Y7yeOI7T7rYjybi0z2M1swPFqs3UtsWpUaE7jU48fvHHsGya5ZxWut3aUzy6iW+0PU8YKv0qZ3lM2q7WspN8uoYPzhjClzqFy/D7YlnN/llUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4LwS2Jp3X2aqKBAQVb40wv4yjat6SqLem5mnn8uSE0=;
 b=YMNReOCnQ/usfLVX5STlh05ppeRpUmqQFfx3Hvr3P5/08hR0jN5Mq1CTpTF1LGFzu7aOdrwQjrqeG1VBSlO+PWGf0Wr2AaK7eVW/2LKx9p5Mc5M30HTpWZ+C1goUnjkLc1HVWeEBPZzCDFJI08ID1sfkQiLnboce1l8YRLM56hY1I513KzKAkQeIqO0G4hKoFlI2ybm+sYIWVyymzSRzmENfqpXGlfV32CV+c04THGDTjlqNuHNnMdEjBsE/TuV/PGayDHEibTvfEXIIlXXTNNAQwCshRBWJ/rno/G7gylBgewx5xqrSvqL7mh4OcYfnZRh8uq2QRWNr8A7KJOFkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4LwS2Jp3X2aqKBAQVb40wv4yjat6SqLem5mnn8uSE0=;
 b=CZfks+XZEoql/eItyC4nxD0vqyKUzS2l+v9vDtErZysWRmk+lSkXCgjXxQpBGR5JC5Luyw1Yc0rJSPTq6SWD1OiW3sU0U7UIVa6Hb3o877f6RCm8AI68X05AHq+pWqfUebD4lY6wHYoySl7+1Z26wrV9UQQJqwdaMctAhVE0wYo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15887.jpnprd01.prod.outlook.com (2603:1096:604:3ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:59:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 14:59:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Topic: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Index: AQHcuFdLMPHY8vPymkaBa167hSz6oLW8Nwbw
Date: Mon, 23 Mar 2026 14:59:34 +0000
Message-ID:
 <TY3PR01MB11346E7DCE7FC74864F738314864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
 <20260320104950.42220-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260320104950.42220-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15887:EE_
x-ms-office365-filtering-correlation-id: 2232b3bf-1a44-496d-b2d7-08de88eccb9e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 EGxhZajzv0m6ndcE3zk60+GEcsU2R2wsfGCegmS10zUTI30KA5J+5BIdO5IG9MTfe7RiLQqOQFyr5icU5lRCgEHJJJbq03uOOZEryqTvEWGdKJyo7X79xKlxXUDhi9eB0Q0hGNEvGR7Dm+AeZFgLVIkI5AAMpPPl30cf44yT62Ncdvd2R3OoSRuVb09S0YZbcVsh0e/2/Ba+jvTUatz/k2NRukSWp65WsHjLuCtWziQIL0YNYzr0OLaD4yIlE1KKN1JKafatb85Y18ydpaHdB/YrhN2oVlHZ96zwCj99dJYygE1WRs1DmwdSri9Ar68h7VkczjW3Sx1WRhfQVjvVG5owULUTqdzG7SJslXap8jDkE9oopUrW7OlYEV61/ftLGenEIC0s05qJDYIAmheq8zaWL3vCKWBzp6qp5WP6+cEF6+aGAymUYLanWhAL/p0n3k/LMgYEiMPl9ysHovXJI3qEE/iOWGb2pKSTRvc6zVdsA8RonDJ+otYl9XF8m9oTPcKGj2AmfCzDogK9wzryrbKCiMKYOLDlIC+FdlFmVyHHn5oNWruB/71TwBmPO97dsesEibXIbDFmFeWJCU/oAxQbC5uv6GOS++1QpRd2li5cHvWT/fk9y0rtZepqmQGBCTrkQQ8o0AuskMJ5GtZxvUU/mH48Wn7mWbsvhgMjXIT9UdYr1O24cEuTeh5fsFAv4KM106TtQfct5BydIoNRQk/aPj+VNlEsbUQwWPN/vDhdxhjeJ8pIcwiPxgNyVpvNhEsvDChnsnbBb5ViuA8X9J/FLA6N1NHD7MZaqsBxstU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O8j25+Tgyi/6w7xjomugbZ7JifcaVPIN95COMQm9TOstRgs10EPjR8m/qkPo?=
 =?us-ascii?Q?GMaUygHB9KvwTcF15SXEFzUhJnWPSag/fJ6zb+kfcASdz586HgRYbXXxZ5d/?=
 =?us-ascii?Q?8RPnRWHdvU3i4Pf0UpRyKJDKk/QXZ6jXTu+nYxUWzxl5HlZJkz+U8ARQtme7?=
 =?us-ascii?Q?nxWT86+2v0ISb2jkrduoxmoTSWJR5NXS7Aqru30A7ZLeLGlCtF/iUALL3o7U?=
 =?us-ascii?Q?s3hdYSmNQrBfh3OH+5ujQmFcBe4IY5ePvVnM4OE6w8VTSe4jPxu0Hb594Kun?=
 =?us-ascii?Q?lZWX1TrtK5fcsXxaqd9S+A+46BFOIw5ygRv8bEiVJiQjMYpi/O1h3+T9aJGK?=
 =?us-ascii?Q?zZwt9ZD1hszruL/bkwogh5KnGryXlbV/5h+PsGzD3J6s3kkBnmSD9ePN/y7w?=
 =?us-ascii?Q?uWjN//LJ6t+1WR7dEJZfkSiS+qjO8OtZaQ4lbHcqs2xZe5FyBkzlfBT6c6t7?=
 =?us-ascii?Q?zwu6f1T0NtEgAZRvaaqC9Vjg+SUxjN0jjYvZ2y40712m7Ajm4mRxFm4oqfYn?=
 =?us-ascii?Q?r/Tqk6Wsj1SFIOiAOJSoe7GlNujU/FnIPXCpCoDcRssCw63yiRCJ8n3IaBDa?=
 =?us-ascii?Q?Ia3ONugPon5l7yY4omnrC1DoydIgFByjCDHIRCpNYkg5j3yKF0BbhNeG67lV?=
 =?us-ascii?Q?UlnMJ5m546OQO+9pj47SUHvUX7ESgiyB8zULX8qhysfkVMpaS/jOmi2isCsj?=
 =?us-ascii?Q?zG51/tsuwsRonKNRCKbWCOBnIh53dPNbfI9t/yubP3QgTkT38qBhZKNG0nab?=
 =?us-ascii?Q?NQP7S5R98RYLSCixBeVnA2ETJ8mgTwUdo4NQC8AjHfKac3lF5Y+FQ+o3PcCS?=
 =?us-ascii?Q?ze0Z4w0h1Vep5ArikpMPfUiT3SWITzNJOxoIJfezLVwxhQKoXRMnwOktoEYf?=
 =?us-ascii?Q?6OFjgVfL+sa+FACp+YFwwitw60RjgVGXAz6cCE+4zI7qgIoLOX5cYzhKUJAV?=
 =?us-ascii?Q?lG5QD5vvU/oagdlK25Y7grZmokS3MEy6XCu9Xn67DnsIyVI5q5Pkrew9Bib8?=
 =?us-ascii?Q?/6RFANITiIIH5CyqLfdhpjyReDVQubAATcp+e0VKCveDOEKuwfTT3lTwvVjM?=
 =?us-ascii?Q?ZTLdbjvLKh+XhBS+9aUdHILDfU2XRcaxLKayhG70MGW1CUfbFAROfDudQDNH?=
 =?us-ascii?Q?Gm/PtPadVZKYLyTR1ae4EsuEbppWSVLoh2zPsqTMzIIkv7yVopg92J0vZyiS?=
 =?us-ascii?Q?1ehfaUOGdKJ6D17P6pEudX7+BvNNpOjcDgOK7u/kWdXGG73Dciv7uPecUCh9?=
 =?us-ascii?Q?f2ZpnUm4qv8gz+0jjrvsDTIMZXBqiyn54ViTk80dBLi2tnzaU7+UEBYsj3vD?=
 =?us-ascii?Q?lkQebmsalfDdRR/VmJpr+CX/2Vj43nd7A+61Bmoe5vhmJrDDdbVOrzw/uwhW?=
 =?us-ascii?Q?f4oDViO7suse4s21L4xXeoUcS7V1lHS+sQCxGjulNQ/x6qI2Kq34deAO7iIE?=
 =?us-ascii?Q?rWChdAdjlkcqGQ8Qj14d92h4odxbnAQzhKfq+lGGzwGgn82uk2lRllmqzKCi?=
 =?us-ascii?Q?WCUk+yhqxYpttoAyikg+euTicx0NywbOE/AhscpYCvqMiEgBMf7DjPSEPmYz?=
 =?us-ascii?Q?ov42oQovNNellwZwLFknOYxoAqnEddJa4cZ2VRTMu1kMMJS5jVxVr9L9p0dy?=
 =?us-ascii?Q?cTH/h8g9ZMgJDN8mNcLpr6b+Y/xUjGeX53Bpou91JaZ6GhzkF5ocoOUOpoHn?=
 =?us-ascii?Q?f7PhHfItnjvC2OTIzOOkO3nPmaIqUNGUB/A+OCq1KZOAw+pReKEdn3Wm1lqg?=
 =?us-ascii?Q?fjrdrHbeKg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2232b3bf-1a44-496d-b2d7-08de88eccb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 14:59:34.2552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZC9p9Rc1uX4+2gBMojcBdA+mAFzi1sLg8DctKwUrdoT4tXA2mfHhYtCEuRnvr5XwlGe1nYETegREzEYjir+ACr35vBcbNVsikn4irnK6JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15887
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org,pengutronix.de];
	TAGGED_FROM(0.00)[bounces-30113-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 413A02F878C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 March 2026 10:50
> Subject: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical mod=
ule clocks during resume
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) ma=
y be left disabled as there
> is no owning driver to restore them, unlike regular clocks.
> Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clock=
s on resume, re-enables any
> critical clock found disabled, and then restores the MSTOP state for cloc=
ks that have one via the
> existing helper. This replaces the direct call to rzg2l_mod_clock_init_ms=
top() in rzg2l_cpg_resume(),
> preserving the correct clock-before-MSTOP restore ordering.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * Updated commit description
>  * RZ/V2M has critical clocks but no mstop, so move the mstop check after
>    enabling critical clocks. After this, we need to restore only mstop fo=
r
>    module clocks, so remove the inverted logic and continue statement and
>    directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
>    mstop.
> v5->v6:
>  * Updated commit description
>  * Dropped the list implementation.
>  * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init=
_mstop()
>    for enabling critical clks and restoring mstop state during resume.
> v4->v5:
>  * No change
> v4:
>  * Moved this patch from [1] as it is boot-dependent  [1]
> https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesa=
s.com/
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c index
> b68b0312f0e3..038b3f8e85a1 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1600,6 +1600,21 @@ static void rzg2l_mod_clock_init_mstop_helper(stru=
ct rzg2l_cpg_priv *priv,
>  	}
>  }
>=20
> +static void rzg2l_mod_enable_crit_clock_init_mstop(struct
> +rzg2l_cpg_priv *priv) {
> +	struct mod_clock *clk;
> +	struct clk_hw *hw;
> +
> +	for_each_mod_clock(clk, hw, priv) {
> +		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
> +		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
> +			rzg2l_mod_clock_endisable(&clk->hw, true);

This call will keep increment mstop->usecnt on every str cycle.
So, planning to add same check for normal state like standby state
in rzg2l_mod_clock_module_set_state()[1] at early in the else path.=20
Also planning to add helper [2] for code reuse. Are you ok with this
or you have different opinion? Please let me know.

[1]
	criticals =3D rzg2l_mod_get_critical_clock_count(clock);
      ...
	...
       } else {
+               if (criticals && criticals =3D=3D atomic_read(&mstop->usecn=
t))
+                       return;
+
                if (!atomic_read(&mstop->usecnt))
                        update =3D true;

[2]
+static unsigned int rzg2l_mod_get_critical_clock_count(struct mod_clock *c=
lock)
+{
+       unsigned int criticals =3D 0;
+
+       for (unsigned int i =3D 0; i < clock->num_shared_mstop_clks; i++) {
+               struct mod_clock *clk =3D clock->shared_mstop_clks[i];
+
+               if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
+                       criticals++;
+       }
+
+       if (!clock->num_shared_mstop_clks &&
+           clk_hw_get_flags(&clock->hw) & CLK_IS_CRITICAL)
+               criticals++;
+
+       return criticals;
+}

Cheers,
Biju


