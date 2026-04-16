Return-Path: <linux-renesas-soc+bounces-31314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICQeEft74GnlhgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:04:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D496040A8CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CD863011583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 06:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AE9379EE1;
	Thu, 16 Apr 2026 06:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ovG4Cwqw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD037999D;
	Thu, 16 Apr 2026 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776319335; cv=fail; b=g/ACPDAcLedtN/K4T7kdAXYY1GB4DVQYH5ChyPhZnxO5gLzQH6g9Y/JPHspVpxpJHL5OJJwFkw6W0JBT5gksn8NwCkRshGf8c5XSiJyBblyb+yCtH/wbtLM/nGAquJtWVz/tFMOK8PAZ0LQPlBMdUTYVExxwK6ndPYYuvEmmrck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776319335; c=relaxed/simple;
	bh=bU5WotJijFY4iB/FhqVId1rVWnh81max7AUhh8+y1Dc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+O20tDlnp3D46nqMxRFu1iGUlmgYLPwOPINlMpDJ2twQfVhCB/vGrQb3MgoqKwu6t3/NQK1/H+bF7S+IM0sWtIe1x4VxDUIPSB0EFyApE+gFvqLlMn5AMLetxaru6UgLuZQ4zsYrP+Uwa66p86gQoQDrmjTWUCAzyJAXPajFzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ovG4Cwqw; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHfnkjEmI9Pgd2OGFZYSmJoq2GyrNesJkX/mkX3PNvZjD93U7w94kfckSDk7TltAxJTfoEgi/5+d2qO1pkszb7NaNZtSdwaCHEWSpouFjUVO179IPjQr2tlaKJ6HQm0M6SjCFBrykJdXJBUnxI0G2jQE2LdTrVJDUMgcKZWw+BP7camL2ujj32Z/DrUYnsOQYIonSTipgqOwphxQp55rwOXuCJTNaEDabl1eFag2tpBievSRSittKhTxbjfVJP9nILSf1Pxvt4joMFWmS35GniSgVPxDxDrI/SSyZdWAomU/o13rAFYLiYFWxbFyxZARdDMbo9ZRv3hql5lcZ0idGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etoio207zBXWGaQ9BtJwfVMu65Or1UoHf/8KNt1tr8s=;
 b=xu310kcK1cH01CnLXITIKk+L7xtYmBGZsKe2nD8arp/q5JAHrEID4g+CWAy0vRY8jAa2rqvslXSmPGoEPgCmnI9R1FpycArUs38Zw2o1d1hW43mVHZoD99X9cYI92zyf0GfJuBGXqwz1qCF/DM357h2ua/9tKMNywtq3EK1G6VLRGrpgDkSWOfKICgTeuV/yAv0lgSXnSEWf+xxwq+AY7Z9Vy2CROJxxFUmd1PB+pG+TxWbCZb8Slyfo2wSsQ5pgPMrRrv7/Z0IVfVLC1cvbcnq1f1h2HMLnyk2exAVu+mJvn3zPBEMFFoX02bMpmJIrBRLDC5D8knqeZOh+E6etqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etoio207zBXWGaQ9BtJwfVMu65Or1UoHf/8KNt1tr8s=;
 b=ovG4CwqwlNC8/Da23nTKRjQNWWxL7/QvXhhT0CV3qwmPwXhTKZH5kTYk25ikrV6GATxTyVYJEppgD9zFZSiVltS90bSY8EzeZ74+28j81P0L/T6i0JwsmQkZkntiY5gH/yfDmZy5PuSoi4f2qdBPP6XeCPZtP8i35fZ9wKmaZ9o=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB10181.jpnprd01.prod.outlook.com (2603:1096:400:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 06:02:08 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 06:02:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: Chris Brandt <Chris.Brandt@renesas.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 0/3] Improvements on RZ/G2L MIPI DSI driver
Thread-Topic: [PATCH v3 0/3] Improvements on RZ/G2L MIPI DSI driver
Thread-Index: AQHcwDJBy4atFmyM2UamT3/YAnHUnbXhTH5Q
Date: Thu, 16 Apr 2026 06:02:01 +0000
Message-ID:
 <TYCPR01MB11332B9E11788D4988B62143886232@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB10181:EE_
x-ms-office365-filtering-correlation-id: b847005a-6889-4427-5a98-08de9b7dad68
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 EmcFHpA57VVEcNBsIyhmkPP4OxmJckWsOeH1Hf4uK5jVl9u/IH/Kb/5IqKdq73R8PhfQhcig0mUdA4Vl9jXnNEklt2iD9/GRCDkVaD/PAAvlutyuJnAJoHR6Jl0CKVHO9SN3OK4xL/7YR5OQYPhSasJseCDHF6khLCWPYM9ZXFZDDXarGdMZQ9WBBLRUUBJ44vz3YPxKaUP5B4kB/YWCOA+MXARb0wwFRZf6TMHKtXKaP+McMZ/yeUVOJ4I+4KmM6XlX9Hd3SalBIcLbe6Ab3y8ZjAN38HMUoqoXR1e0bjWdfQektEqNh2zI36OH5FKpf+8HTTKtHzQ9NV/VV4UgN/ZkSRUKdMh3LacAwOhiWcryu9Lt1O3YjmYcdZC6y/eQ3tknF+qLmkVZC2Z6jXJDRaThJRd5Sfb56FluOmtX3QwrWZEl0tjaE5j+bLLHHP/Me+lqRyyroHFZVVsDQ6JfuCoZXFGXeZZDgeDTRLNhyJt5ok6UMD+6kjUuVtsyq0C53s0ThuoOERmiZ0VrmnxqPDr3ClfDl8Ryf6bpbJ4lDl/cIXCqSe5liL7Pz8KJ2wB836XmYTLHMBOyD35gnkR+UE4TjbqmrZL+Agi3aDa90hKDu9K8lPDWIz0Hx/RdeatfS01i/OzKzW5KhG8LU58oyBiq0s0DG2+zc9OUSNLUi7eTemIIMuLEYmiWpgL9PcKaZDJRC08J8+jhuABRammNy180TJ3fBOOvZV1Qpq+RsaUVGM0SGKTGuxPGbD7OdS0CJ0v88jemSKXFK82/yC4/ADMzjDb6oIMID9Cw+C3Ixt0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1/1fxsLufOsKFcds77hwVP7k7AxmekgN7i5huY8HGyMRexAhAVGRMjF803JX?=
 =?us-ascii?Q?v2D/hDVM83kvwEXGvbbzt5qCRUjOlOo0gxyJR9lrk3XAHgAqugwgfDgLp0kU?=
 =?us-ascii?Q?9+BDjsmAl3qhC/IUT/anYmRSyID8hJtVqdJ4a0ynQvlwlg1uaotlA4dBADwF?=
 =?us-ascii?Q?WAJO3gnHiWY2LRTXh15gB0u29HiW3biAtlXGjR81m1xtURu3FNCdDlcSd2R6?=
 =?us-ascii?Q?hDngNLFOebv3pLwnH2IAb1byPBJmFPDEy0HDGSlxovZDlIXyrdi+jCAssF/A?=
 =?us-ascii?Q?cqklgdlxkxmyxFb1IY6e14fSlkm+1z6EIHkz6ee+sL62LE2v+Q2bPRN4oKGi?=
 =?us-ascii?Q?6EwCi94vihn1v+cySQtCt8ahqLJlbQzbVZ5WavvURqCLOd/wmqjVLjO/F28h?=
 =?us-ascii?Q?fy6HrOn+51j9FdqlTlaSBvgBFd01tRA2lss9Ndv6xqC1o0IR9Oxjp8/1UKZr?=
 =?us-ascii?Q?oJCfMg545MbeEfTl8LWn3xoL3fWbW/Iww0uWOC1g1QbMIN1V3YCTbH5ZaeU5?=
 =?us-ascii?Q?QUsRyJY/4NRfjIImNHtoAsC3tWrJYXSsdJt4f+vRmXgrpRkNpgdPJzVD3GME?=
 =?us-ascii?Q?yHuYMsxcP4t4svwdoQ5AFKBXClw8eJBLKrggfqiTxfKsGogTdfMY9hfx7pPU?=
 =?us-ascii?Q?KyfuqE5Jg0A9aeZPNaRNttXHLOH5E8/trOW/QMIZvAXngZCQ8SicfIJFhE5F?=
 =?us-ascii?Q?AfWR6r3cv/N2SF+wagpar/Wlrqkv+EdgDWpeoZ51xmoydBogvSLxOM53d1aN?=
 =?us-ascii?Q?01qvbYOIoVs/RmyPvEuIZwG47oQ0WUZR33D07mYsjko44cs2YLLadnz0/LwF?=
 =?us-ascii?Q?4Qx7z+04rcnx35nffEuOJ6lmKNhPRNu56RyS5R9gykTENYyRRKqYAR9CelV/?=
 =?us-ascii?Q?Wbb39hV7haI4b9VpeNry0PYwZcVgtR88XdTKUhY0d9Eh5gr1qbMFim4tMHO1?=
 =?us-ascii?Q?4rODSjtmQuGIGWX/W1+D8PJYERt6WfXGSKJvNNgGzl5XPoOMgYeE3RzW66Un?=
 =?us-ascii?Q?yZz+GaWy/zvbZJIQ1ed1m9kph4cNkbSD5bSl3HsFYCzSJU2l/Fby2QVbGnD9?=
 =?us-ascii?Q?S+Q6ZJps06hdHPRd4e4a7vnt+HRRwqK5HcIFJHGGh8YxWS7bPPFZ3Jxci4+G?=
 =?us-ascii?Q?OrTo3nS2e6SlzVX4iTs4B68lKM5/PgcATZWxJ8ZUKV55KdA0vccOYl0w/GAN?=
 =?us-ascii?Q?v0KF2fTUkDDly56D3r+w/+Lank34DhC1q66QthXhnlxjz8S8XHp9CFEz52cf?=
 =?us-ascii?Q?QCoRDNmwIsxmFMLZamsFhZcgjl/rFOMWwS6oAi73wyjCKi2lbbTQSVZXBjCR?=
 =?us-ascii?Q?QfRNKvr+GF1dFwaKGOd9xKLGOLeZYd9SgHqaGTNjbTLVG/8j0UG2f4k7rw8R?=
 =?us-ascii?Q?GWWYjrOhMAJTdxSqFMSBxUfQZxUlN7IudsWMpzIsr+nmjKWRFELdKFjZl1gF?=
 =?us-ascii?Q?trmBmOJ416sYcilJq/k/Aqb0thOYMQ0Q53m320yZvy8DfpKDIG10AqH58X77?=
 =?us-ascii?Q?+EafuBDSDBZUsWPcj9E59KSOjDvcsdYHf/B8ZLD+z9+hBLBeM8K/nNKNrBQy?=
 =?us-ascii?Q?BIk9Ent47moLzFyJlwn19nrQt5yhZ0vVlrGjqcOv0Twa4p9LZpmLNVxwN2JG?=
 =?us-ascii?Q?0qsNXKqqCWZDRmBmVj0GPF898Brrtv8DWQVMDp9KvSfvoDtzrTX996w0ktNn?=
 =?us-ascii?Q?EzcIw50CzPzmxSgcTWBakYgkwovre9gZz075X8x4eWLL57bTf9EXiMv2m51k?=
 =?us-ascii?Q?Cdx9H/0jlw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b847005a-6889-4427-5a98-08de9b7dad68
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 06:02:01.5457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZwsFwjd7kIbydlSJdnzIRq4rnNehyQ+rA1SKCbSlc9BXq1GN+54PMMJLuDuzB5Xw46OPvg1WuhyzHqGYNapue/hj572Tuag6RhX3JSp8po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10181
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31314-lists,linux-renesas-soc=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: D496040A8CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 30 March 2026 11:45
> Subject: [PATCH v3 0/3] Improvements on RZ/G2L MIPI DSI driver
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi All,
>=20
> Enhance the RZ/G2L MIPI DSI driver based on section "34.4.2.1 Reset" of t=
he RZ/G2L hardware manual
> Rev.1.50 May 2025. According to this section, it is required to wait >=3D=
 1 msec after deasserting the
> CMN_RSTB signal, and writing to DSI PHY timing registers and LINK registe=
rs should be done before
> deasserting CMN_RSTB.
> Additionally, the hardware manual suggests display timing settings should=
 be done after the HS clock is
> started.
>=20
> v2->v3:
>  * Merged patch#2 and patch#3 to avoid breakage.
>  * Moved the patch from patch#4 to patch#2.
>  * Added fixes tag for patch#2.
>  * Updated commit description for patch#2 and patch#3.
> v1->v2:
>  * Updated commit header and description
>  * Moved the code from rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_start=
up()
>  * Moved the check before calling reset_control_deassert(), so that it wi=
ll be
>    skipped for RZ/V2H SoC
>  * Added fixes patch for moving rzg2l_mipi_dsi_set_display_timing()
>  * Added fixes patch for assert of CMN_RSTB signal
>=20
> Biju Das (3):
>   drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
>   drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay
>   drm: renesas: rzg2l_mipi_dsi: Fix deassert/assert of CMN_RSTB signal
>=20
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 34 +++++++++++--------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>=20

Applied to drm-misc-next.

Cheers,
Biju

