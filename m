Return-Path: <linux-renesas-soc+bounces-30897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AvtIFz50mkXcwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 02:07:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 050063A0C79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 02:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90D873001CE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 00:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A6740DFDD;
	Mon,  6 Apr 2026 00:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C0GceCrg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28873FCC;
	Mon,  6 Apr 2026 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433941; cv=fail; b=c1XqWSR7Py7J2P4xu6QM8N0tUTBIOG4H9oIi7eWSf/Zlf57a9KHiUey2DhZ8NB0/Q32zJAU2oU9I6CQikuCdzSLis/r7OVslNP/AahtJ3AI4E95hkQW86SbIzNFFR+3f5v9rj7MpBEoUqJq0NEW5plFwPjrPLz6j4fncSFa0OoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433941; c=relaxed/simple;
	bh=bEtizZ9mDsEdMXQLT504FS/RF0n62mHhTUz48dyhX48=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wfx0/sxN9L6vlSV6s+QQMa0QRpxxtU380dHXDn0NilvyAgFHcMJRDalb586bXLEMRRzhjFSliE0+Bu1e9b2YA8agEwPRTLL+uEVx2y2uX26CnSaZSq7JoJjyR9UrX8rafaKav4dgIUHsTji3I3Nm08t/BIaQpdCMMJH4m6M9UhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C0GceCrg; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc6i9W2isOEcIyGAtcLJqVWqzLJcDHShdFgSisfaERhZpTBCWgXUSosVNuhwVdtTPTmwjPrK7NrVg2Me1V1zXLYAIhsb69Lj7lGUYYF1wEQ/KSrA5scLhKb/E+KUtPGNi4gwYKelvTIhbkm85dp+KHbBClwCkpgrNvyxT9L08lJK0jtB/9UYV2JIvgur7gWbw9lP/vpy1LNrWNsKgYBe94RjGymXNCUyJPJsPOtL/FDUB9K3sZO3cmdrB+5EVOgBQBOK2+Cvu1KbQD6f0Q3ctE3kwQMwqqvrnOWTUmsTYZ0zors5B+agsVqiNWZu4ilGpu5DFzNOtwuB2Apgw1NB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26y/AAvDIBczV54i+8872P1NUxjiOL7tzj2bk9infpg=;
 b=yMKBRMQoxhWfLmtD/s4EBB0FP+vtLtTmCS192TmbvwV9t+J7pYsbFUVnUjfPMe67OR/xoDyWC4yAy+Hz7YUAGkPJP6cT3cIVUjVai5iMOXeU9G8eLRjZvw7oUrV26q9eP+5ykktBZSh8vOsternF/5D+FRZ06jtBEM3gGpt0jrn20BTVlxOxtTJBL5Jy7uhbPFRUEL2A4h5Y+50x/6HEa2g6c8f0YCbFA1ajDVvI1c7B5hhF7bYzRFapkXOEGgkkxbUgREspAlCSeJUC7OxWdH4C0aUR0jvzHl8CsHWlYmvFu2UDiN1URhtxeQr9S7ozteCLS7eGIwWD3PM/OdQeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26y/AAvDIBczV54i+8872P1NUxjiOL7tzj2bk9infpg=;
 b=C0GceCrg7DB2J4rcgkeLqMG0u0oajbHaY5EoO81MdrFQ8T6vKyXh3EQsNSLupie+5fc2ICoPMEAWJxWxK8Xf9o0NmlZ2V6wfqhvB1PZSMQ3L7MgN5+i84J8nGKV99ZOqOkEZolxs+2eg2Cg8SIn69OHPq25yFUTgKe+m/0t5rjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB12262.jpnprd01.prod.outlook.com (2603:1096:604:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 00:05:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 00:05:32 +0000
Message-ID: <87tstpt0l0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	magnus.damm
	<magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das
	<biju.das.jz@bp.renesas.com>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
In-Reply-To: <TY6PR01MB17377F16AF407BE9C71A0E1BCFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
	<87ldf4g893.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB17377F16AF407BE9C71A0E1BCFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Apr 2026 00:05:32 +0000
X-ClientProxiedBy: OS0PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:604:9a::25) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB12262:EE_
X-MS-Office365-Filtering-Correlation-Id: 760ff74e-8930-43af-5602-08de93703861
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nEd70xzqOHYaIexE8cBJ5YEMZWAgf0ZWD7WMMvTTOZ40bHmy8Q0eeMTex0t9F//6OZrmEYnXfKhynzKhejO64aUOSmZrdjedsdc4H1RcRFIQSDSLAu2dPoYIzhoxzldqzJ9uhOI6qsybE75qZ04pYsxMqVVKrwy+Ivf4+9vIl+bTqLjQdQizP0COzto30uaYdox5IPoj9+hWFK5NU5k42k7+yAYInE+NZMWDMy7U4UWYQ0sOCWU85SAHUHvb3/r/cO1l7qsA/jJh1RBeNpA7zG0y+fM/QrRS97b7RwPnxfe58HS6XA2v94ZXjzmhukXwDjpue92u4Uty0qX/ewk5g2PE6HFDArZF4103BpdzWVL+rPMmOQD8skEe62k5G0BTOkIIR7ihLpIp8ToRG5trjQ7ax+I0yuKOn32qPfc61AGaIEw96mBT2OJ58OiCY46kNq/TCeoxpj/7fETOv4VfnmxRjyt3JIOsiGHUsac4f6Ni6CjFy6331yvLjUSOts7K8r7iFpZPyeWaU+BirKTE5qI5YL9yNcT8NzJicTG6336I2wGlkzMUXtFMudJhufzdPpTcXOMbBEzuE5ww43Iesdy+TXMt8XA2JcWDKxknT/Jf49L3SfZ2y/9VOtdiGnLLDArl3r6w1dz4TsruMZDmGWfANqGBaR+RcJufBPcAtVzOqui+4hFYpv8xVNE4b23Xnlxcw1sBbL6/EZy9fZv6JVhIUPmZqJP8HB2WsC+Ew+3X+fwIMxquku6ORGAtox7YT3a9Fiyqp5CjNjtZwr3KdL88EekS/EMXDIYsmuc780M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D+9E4fKo+PaRJL6tDc4xENFMpHmINWOxgAAM6AcAZXtFXrfm4xPhn2WV7nof?=
 =?us-ascii?Q?s3Ofy8ojGR4C+9l0APnxEc0SnOB8xRfPCxC92GeEhC+RQKef/6fcW0v0dJQb?=
 =?us-ascii?Q?nEy2bEdGBSHgMU2MjkddeVVGIM2qhfr4jysYKsOFIHMadmBM5tqWqbnag9gw?=
 =?us-ascii?Q?REF6YQbKtfYU39ovjPjnK+i4YZGr0vDX7gul3P1BVyUKgKbcv4gXFzIROMhv?=
 =?us-ascii?Q?CFZjY8xDIeaR6MEmqzmM+do/kCljcZwYur3zAcJl3rs+YYrNNqTYz2NicDw1?=
 =?us-ascii?Q?/rC9EVmMZj4oUDExLSwksBNptVvAVx3n4PfoCUje5Q/qykLWzw3bn8zXCxUX?=
 =?us-ascii?Q?89zczVBTsrfoGPGzOzqqt8HtmXha9HGZj+rs3tMGUJ1DpT6w8ImD9yfVQRro?=
 =?us-ascii?Q?2O9dAlJCHOuUyl6oHfhZGrvhb40xJJFkNgsSM20xvND3FvLbfngXiMkOo2sl?=
 =?us-ascii?Q?+RRwPuEVKwkKxpOE2kgbHgi8txIsWhkIt/Gi8PRIAdp+r9hkGGQB2jlq/9/d?=
 =?us-ascii?Q?v1qEDt1RKlct/pw8wCQRxMxeYBVZJaRPph6uMbmFBIo7NvINH+3wjLjDQNgH?=
 =?us-ascii?Q?qQJCpFoweffzs0u110V2A4//529q8b/NpaMZg/py/EnbPpV4KrmvxFy7QMDa?=
 =?us-ascii?Q?Fp+LnLXS34X0fB3zgbiUsJX+u48RWxt10sHy2QwiEp4xs3l641ND0WNOslEN?=
 =?us-ascii?Q?79pyNI/9dkCESgyhq+QpKI0s07KqU/4Cjljur9htajeKoSby6YOa0yzNZJsx?=
 =?us-ascii?Q?N5ZqK4kzyazuaP2sE6jgzr2G49ShmHehHFxtnSyLsVNi/w7EO11rsQ43vI/F?=
 =?us-ascii?Q?zFjmOYMn2xNtv2VY9EAYvt4itYDxN0ZEmIUxuSkbPy/zcpMAS8VBcP/J97x3?=
 =?us-ascii?Q?BmYT/9VinhHL079X/ezAZWh3q7o0rhh00hlVpePQ7uvGPy34TJz4IkkZGG08?=
 =?us-ascii?Q?9aTxscAQWunPkMkMEZ8kEWA3t9rgJc7nMV/SObx7yERCiUcxmtv3gjFd+LjI?=
 =?us-ascii?Q?Qj24ZHyo3Tg4pbtv2p/8TKGlT5ATJyb6FK9yeVe9p6RczdhPMZsFq8zj7yVD?=
 =?us-ascii?Q?ujnQvpgso9q6GjNJVJ/eDMhCn9PAhze3sF/VDu17cs7pu5oVwHchSl9yzLEl?=
 =?us-ascii?Q?vKnf+PrDwMlms9md1Ma0QjGQL0jyvuThPbfJ/SU/7pIkvdvQzDlU49l/94gt?=
 =?us-ascii?Q?HX9HmBjqw9YTUzCpnjxPWv7gGTEtZmy/UP1fmD58MD47tXVqrW1DbeBTNG3q?=
 =?us-ascii?Q?3UkUXmQuSUGHK4JNTLg0UWFBe7PLojpeBvF1z7Le0GEK1CfQ2V3THV5vJecF?=
 =?us-ascii?Q?ei3YgVcv9V7y0jIyomDP6Lq7peh/52z0oYMKcUr6o+eNark14Pxvzaw3v8f0?=
 =?us-ascii?Q?OltdTJuSvQV9UzbC1JGU0+YCh4sx/XvoZs58qGKFH+2j9HrROMU71bOliLWQ?=
 =?us-ascii?Q?350BmgZbpOvWBGM0x5lHGgu6C9aSrP4mjY51IoZRl4+xpC0zMALmhDmYgYCL?=
 =?us-ascii?Q?nhjrEja3dWwrG6RTYTuIPFwcbrdm/YGXfROM1BdV41u9SBkIEYqZJihWXn0W?=
 =?us-ascii?Q?XJNQ3SnrkoAeksO/75Jkr3CPM3GgJKkAcEfsbcAuGJfmiIZl6KureJjC4S0G?=
 =?us-ascii?Q?M3Dbxezv2SBJ26Y2Qa+MbVDR+RLfvv2N2PWh0mtaW+DQ2M2+EMjUwf5ReR7g?=
 =?us-ascii?Q?4Rs8qEK1KJVdz9Z67DjkMvGuFhc23iv9rDa0z+wozwIFbUbQFMdknqaCc5Oq?=
 =?us-ascii?Q?fJC6UzrqTHActFRClqrHkCPwmFoDcZZPArQfhegXPn1d1vYf6j2K?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760ff74e-8930-43af-5602-08de93703861
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:05:32.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KW8+jwjsDVI7ENgbfMgvLG+fVL6e4ydmCwpvW7Iu2XGNuVOLT4CSgLo1cfB5xi81HFLxCxzXph9Y0Pg4xmd4+9tg9oiUGvpVcUx+qz3lgD3D5m3DFVu0f498E+UeeV1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12262
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30897-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 050063A0C79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> > > -	for (i =3D 0; i < 4; i++) {
> > > +	for (unsigned int i =3D 0; i < priv->ssiu_busif_count; i++) {
> > >  		u32 reg =3D SSI_SYS_STATUS(i * 2) + offset;
> > >  		u32 status =3D rsnd_mod_read(mod, reg);
> > >  		u32 val =3D 0xf << (shift * 4);
> >=20
> > ssiu_busif_count is for SSIU specific, no need to have it on priv.
> > Please move it on rsnd_ssiu.
>=20
> Agreed. However, since this is per-SoC, I would rather use a
> file-static variable, rather thatn per ssiu instance in rsnd_ssiu.
> I hope this is fine for you.

From "meaning" point of view, both inside/outside ssiu instance are OK.
But I don't like to have it as file-static. Because it could be
overlookooked if some kind of updated was required around here in the
future (=3D people will consider ssiu instance).
Unless there is absolutely necessary, please keep current style.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

