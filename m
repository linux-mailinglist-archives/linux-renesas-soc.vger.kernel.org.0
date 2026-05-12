Return-Path: <linux-renesas-soc+bounces-32503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Es5M6pxA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:30:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A699527A4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E5E0302D188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9896B3859CF;
	Tue, 12 May 2026 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pL/XDlm4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33A383334;
	Tue, 12 May 2026 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610469; cv=fail; b=nzTCl69Jla86f6jVP9ZOxDDzyXAmFurOMy+Du3zK770poQdQ14TFA2sXPr/fomcDp+TjL7pebb7LgSkIdH+qqw1M4lF6Xa8GEyKEfzp4E4FNww+jx13VgX/GbE0FIhhZIaHayLMhFR45KijYXwt/bDi/1Gk6Iqf5le/eeAsD9tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610469; c=relaxed/simple;
	bh=6F3kLmFDSqm0362b5rmGW+HPn7APWZKZSXsgiJvIr7M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LAn4UHUGw6mPQoMJEnb2eH0buo31feP+4gaRPumgxODDZhC/NFjrJaGy+nBzWujbVp5bS7Ks1OR86jc4zrO4yskClQsacolZuc8riCaxi1P5sJu6PxNjx/+I5XoX2FlYIe8Ly/Vb+xN6nrRX45epgZqJNqJ9oJ8trzjsc/e5/ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pL/XDlm4; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTE51i9lIyWWhhGExXRt5EDIXVCRtrxlA/+PWBXnZxSiCDma6SbaaoUKHwsSAior71qAoneMaIW2R0tXLwyJOJcWUgAaaIZ7UTxYlhUxvXAZ9YlRKSvMCoXF4ZI9nFpCCzVECdsvOuiPSlb6DhTtpg6yIW4kvza7Kg9oIXvnCbpBaDBfCdUNEKAOY/O2ZA08+Fd68BGH8+MxxPnNmzs56BEc5+L/CI6UBupTaxjyZQCWLCTPE/L9Y0DLY+cvXu1J2ugKN7wUGRAR3aZFSttjkTCS5/Q1Bq7TFjJgiPb5rvvL2xnuhsiOO3q5AmnML4JaTHmjXJsLOZX3wVUyYxr2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZwXcr4i3kWE7S2J8lo84GblanZ5WMuqSlXKabaT+K4=;
 b=wjTYCaLAajAFwjU5F1OtgUgXbwaLwIf9zHJfuqVT5GW3gSZA3+O4QLLPnVgkpArK/2jSVU3D0HflmhJkMTuDYySohQCRT/dL6ybVFa95hJ0q3Yq/yzepnQxtvSN7arBW0dXKdNhhw0815ml7W23c+WCETfA5pbkZvTYNGJcjd8KslT7FwFDQ4rA5wJNGplcmFYOHlmGPxCqOVqzmHJTJqiWARcz86C9lpmntbIAJv7w8bqzeEs3vjwpB+NnUAJ6XYnNncAhWmAHTGyYcScvyOQLcMCEsJnMZevSDC0sTfBArva9qmOz7uUL+16UR/utgZmnQ4kJSh2R1nBRa89BQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZwXcr4i3kWE7S2J8lo84GblanZ5WMuqSlXKabaT+K4=;
 b=pL/XDlm4A4O1u9lPz/slodl0t4CVc8rEcJpFKVx/m+FxqAwBZ2txsymZa8exTDSvnTk+PE4h/ZACiJUKBXa1EYFHPUXl+PguB5OMWMDeZGj4HqiSnNjh/WOO2SgxxGjk1kOyvUggPnLm05gjXS1X8pGzA5Pkowcr3+XerTGiiP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:27:44 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:27:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 00/16] ASoC: rsnd: Add RZ/G3E audio driver support
Date: Tue, 12 May 2026 18:26:15 +0000
Message-Id: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: acb43845-3d78-40d0-8251-08deb054285c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|38350700014|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	tVzDbEfXz2d4gkJsQuCxbPsBayKgNsDTXgPfmBjzAY2BZTWcttN1vxKhsLzcR9qkcqK4xXwydTtJb87p5Uu8zQhpxoLlvwLVxVLLpGcVpRlttJ/4rg0WqB42Tu59RFo5AvnKMJdhqElIv9Mw/8HD5YemFM9r0WZHTd3wxy8yX0ylQjMMBN7eOQXg2SeyXjCrqKW16Z2V/MsJcOt4KkgauHFX7OOC9oAz8aqntQyIV8PpX70kthPDbgLXWpf+R+UVmHPX7BbdHfMmgvU96IEtVJ3WbB6qmSCMvh2YwWjFWnOCBL/kblZGy5uGEytDe5TjrsfDGlX1jnbGwl4iGhdo0HMvSpn1TP6GBb4skkSul76Vaw6H6ebMW1YzyehR+VVxlyhLoe+TaQLBe4YTxIEu6ywO+dzoAf10e+QAmoBHB/osLDT4xuFmBXZXwyeq8Uo1Me7fAgaDphCYg5Z07bhzg5K8lLZ/XCnVdtI644Qk5Bqzh4QHPrFGnqwiYAUlRs4/ACM0kPnOGWPKHizS223Oc1HdY2MAcSwts7iy3aAAp6z31cbn3lScAlDnG3JthHMf6C/YZDjNFeVmdMVaAQPJ2b+lAIMPCMYZ6kqaRzQ4aT7dRL2++7XcDGm4HFkZ0v6NtfHsLW48LVPF3QQPL0RtGpkQa14491ZZ2LN0bLEoIYXCmk5CLzEKADq1INSYN0TBNARYDklwNonebG2kb8E6Oe3qFVeLBtN/vtUIcNGKGP8uh+uzXrehVCIPqDLuX6Rb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(38350700014)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IRx+Nu8pdYZjhS9kZNedAwkpCObtvwOGL9cK8EZgEllsA1I1qcc1ndZ0y8yf?=
 =?us-ascii?Q?yxIlGvkstKrq+GaqjyQmUOJyCpR8nD6oKVjYHKJPmhnXIfC5anGtKvTIxq+6?=
 =?us-ascii?Q?q24pOT8mmsxABjk4/Zmkb3puvRIc63M0NPrgtIGADqDzSAnhDCLNwNVziTN8?=
 =?us-ascii?Q?qkkMs6CZrXZzgguVMSLr68+q3zYr07kYdpZLvahD4/cx/t4zP33ZBjKfE63R?=
 =?us-ascii?Q?jv4IX10dQVQQjsuJeH+0u/2cwOmQg+bze70Lqtx0EwrmT4dxpBwMDWRUvnSu?=
 =?us-ascii?Q?LLbnjPkcOVkwZk4tptE00yuW4j04x6gjXos/hPpgKIic+3tnYy1of8WI6V2w?=
 =?us-ascii?Q?CiXY3JYyRd6HA8fYUYvrWGuXgPOSrYWkqwGhiXNn0jcHmTlFTfyuUFpuJXyw?=
 =?us-ascii?Q?V8w09K1DG5jvzqkT3cGr0npUKdOGZ1b3jt96wBtVFBU/9+i5YKCJ52zrrR8y?=
 =?us-ascii?Q?P0mmjhlTGshN/lWZSqcT/GxiTFBVTLVTj6HHLyvikmS6pEzfBwJ+JesQjmxY?=
 =?us-ascii?Q?h297Mm+vsH0UPQ797IO5gfLN8/pTo6Kr/gH2DW2+K+XOMkKNGzt3dn007DjK?=
 =?us-ascii?Q?Yg75MSBpVwMA4P8OagGr3hmfkxElmxY98QXC1RFUpRPlvvlAAIcNwMKYUT2p?=
 =?us-ascii?Q?KvfhzQwRr+qRDrwqN59GBUagfXISc/5z9hA+GQb5ubaBRK7AMYOMVQck1ooU?=
 =?us-ascii?Q?bgH80P0+DtnPFAO/bZjhRupvysb1v0FGnUMh7b9oj3L5wSOJVbq3kOGJ/xVN?=
 =?us-ascii?Q?sfpVs/yb5dkcMG7ar71biVGdZbH9DLkGLWhGYxvrXCKVCZKhJNXXuJCTGlxB?=
 =?us-ascii?Q?lRzQSx9pycqsOZeBQSDv8r9b1DQX+t0Idi7ocm2HDBpHR8vYDdny7McYMHwM?=
 =?us-ascii?Q?YxYwpuJ398MlupFh+DJqUrx0C14KX6Op2eBlrBt7h8hLRSZ6ymSAOnsvitgo?=
 =?us-ascii?Q?GThi+w98JNCIXp/0fSR9e6Ia6BlKnt8ar7H4AAIcmeaT9MEZfnTAajRA7lJ2?=
 =?us-ascii?Q?uL91qsHHGIUSTno5wUx6cWMhLpHPC7CT3MXj/GQFmYZGu+16sAKWDeT+Alma?=
 =?us-ascii?Q?OX5hnrqSaOWGqkAAG8/Gq1SsTIEscMZpiZ+rxV3uXiwKFjHWUY3gI64FQxY5?=
 =?us-ascii?Q?ZnAj4A352/nuKLQdB0BYK/xEX8THVBDfA8UElc8Zz2brliMZxcxBtQn1d+jp?=
 =?us-ascii?Q?7O5OTx9qjxLtjxY4AXSzY2yd4mr+TcVU574VgneeB64JjmtGNzoT9xEUoiNG?=
 =?us-ascii?Q?k1MztjSbK3Xer8KKUBPRzejJgQ9CLtXodZ3YzDIADN9HTuS0HpgVVWAIDWgm?=
 =?us-ascii?Q?YsZZnlebrlNP7rV+1O3K/R7tndhlyDL83rkKTxGboVUTRaYjjNAfTwq0ivuy?=
 =?us-ascii?Q?8VKo8TVUwDy16ZSR5l3bi+vWBRJ1Q8JMM1zdJ7Qp/rcmYTWte46uvXR7bJhC?=
 =?us-ascii?Q?NirCE4wMYZzaE8DG0C9F6jGisvBqeULwG6KZwt0LH/LksK+0bTVJ987ZJuch?=
 =?us-ascii?Q?pRUZAaXLQyqSWghCPGHkeFw5Xyb2WG3mmP1FPsm1WofBpyenipYjrvmVy6nt?=
 =?us-ascii?Q?yYIEsbFcGueTnPidAL4kq9rk7QJPQAS9kjG0CxC3QP8jibS4yqHBuqsjlZvl?=
 =?us-ascii?Q?qz/yjfC1Dtln8z575TThwJJ41uN70kDNCls/QKqK144nb7eVmqTUdaFZuMd9?=
 =?us-ascii?Q?vNw5bZ2GGA+xF+AtOIhdJ20/k5iIxZPFnGg4Zw8oa9f3dAVJS0UpwQ9mh5a3?=
 =?us-ascii?Q?PzCqLpQU9+bCBxMereIXGzSDtxh8tDs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb43845-3d78-40d0-8251-08deb054285c
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:27:43.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC8GCG3GlRPucCCp86CbmjZNiE9Js4+opXlxk+FQ+S1UOzmH7t7bXquz3TP71TDHG47OtrTfk3gA4PlYZXj1pzJsvSRbTBv8XMK1iSxB0vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 4A699527A4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32503-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
has several differences requiring dedicated handling:

  - SSI operates exclusively in BUSIF mode (no PIO)
  - 2-4 BUSIF channels per SSI (layout differs from R-Car)
  - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
  - Per-SSI ADG and SSIF supply clocks
  - Dedicated audmacpp clock/reset for Audio DMAC peri-peri
  - Per-SSI and per-module reset controllers via CPG
  - Unprefixed DT sub-node names (ssi, ssiu, src, ...) instead of
    rcar_sound,xxx
  - Hyphenated indexed clock/reset names (ssi-0, src-0, adg-ssi-0,
    audio-clka, ...) instead of the legacy dotted form

Link to v5 at [1].

Changes:

v6:
 - Rename all indexed clock-names and reset-names from the dotted form
   ("ssi.0", "src.0", "adg.ssi.0", "clk_a", ...) to the hyphenated form
   ("ssi-0", "src-0", "adg-ssi-0", "audio-clka", ...).
 - DT binding: tighten #sound-dai-cells to const: 1, drop the unused
   clock-frequency and clkout-lr-asynchronous properties.
 - Add a new preparatory patch to handle the hyphenated DT name first and
   fall back to the legacy dotted form, so existing R-Car DTs keep
   working unchanged while new bindings can use the hyphenated convention.
 - Convert the SSI, SRC, CTU, DVC and MIX probes to the helpers and drop
   the per-module name buffers and NAME_SIZE defines.
 - Add a new patch adding a third clkin name table for RZ/G3E and
   dispatching to it in the same style as the existing Gen4
   branch. CLKA/B/C/I enum values, the clkin[] array and the
   BRGA/BRGB derivation are unchanged; only the DT lookup names
   differ and use the hyphenated form.
 - audmacpp: enable the clock before deasserting the reset so the
   block sees a stable clock on the way out of reset (and mirror
   the ordering on suspend/resume).
 - SRC: use devm_clk_get_optional_enabled() for scu_supply and drop
   the manual prepare/enable in rsnd_src_init()/rsnd_src_quit(),
   so scu_supply has the same lifetime as scu/scu_x2.
 - adg: simplify the per-SSI ADG and SSIF supply clock
 - Strip out the "rcar_sound," from binding, DT, and add corresponding
   code support.
 - suspend/resume: respect the probe ordering in
   rsnd_dma_suspend()/_resume() (assert reset before disabling
   clock on suspend; enable clock before deasserting reset on
   resume)
 - Guard rsnd_src_suspend()/_resume() so platforms without SRC are safe.

v5:
 - Drop the rsnd.yaml binding split (patches 01/12 and 02/12 from v4).
 - Extract RSND_SOC_MASK fix as a standalone bug-fix patch (was
   previously embedded in patch 04) per Kuninori's request.
 - Split the DMA refactor out of patch 06/12 into its own
   preparatory patch, so the struct/lookup introduction and the
   RZ/G3E address tables are in separate commits.
 - Add new patch "Support unprefixed DT node names for RZ/G3E"
   converting rsnd_parse_of_node() to a function that tries the
   legacy rcar_sound, prefix first, then falls back to the bare
   name.
 - Simplify flags layout comment per Kuninori's feedback.
 - Add comment clarifying that clock/reset acquisition is optional
   and no-error when absent from DT, and drop spurious blank line
   in rsnd.h.
 - Move RZ/G3E DMA address comment to rsnd_rzg3e_dma_addr(), not
   the shared header. Separate the line-wrap-only change in
   rsnd_gen2_dma_addr() into the preparatory patch only.

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init() (Mark Brown)
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with
   RSND_RZ_MASK. Add nibble layout comment documenting the flag
   bit allocation.
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl.
 - Replace raw [3][2][3] DMA address array with named structs
   (rsnd_dma_addr_dir, rsnd_dma_addr_map) for self-documenting
   table initializers.
 - Move busif_status_count from file-static into new
   struct rsnd_ssiu_ctrl, following the rsnd_dma_ctrl pattern.
   Remove duplicate priv variable. Properly propagate reset errors
   via dev_err_probe().
 - Clarify commit message regarding PIO mode still being available
   on R-Car.
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single
   lines.
 - Move per-SSI ADG and SSIF supply clock prepare/unprepare into
   rsnd_adg_clk_control() instead of separate functions.
 - Move shared SCU clocks from file-statics into new
   struct rsnd_src_ctrl.
 - Merge rsnd_adg_mod_get() helper directly into the suspend/resume
   patch.
 - Drop former patch 12/14 "Add rsnd_adg_mod_get() for PM support".
 - Drop former patch 13/14 "Export rsnd_ssiu_mod_get() for PM
   support".

v3:
 - Split out from v2 series [2] to ASoC-specific patchset.

v2:
 - Split of rsnd.yaml into common and R-Car-specific schemas.
 - Introduce RZ/G3E sound binding as a standalone schema.
 - Addressed Kuninori's comments (details in individual patches).

[1] https://lore.kernel.org/all/20260415124731.3684773-1-john.madieu.xa@bp.renesas.com/
[2] https://lore.kernel.org/all/20260402090524.9137-1-john.madieu.xa@bp.renesas.com/

John Madieu (16):
  ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
  ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
  ASoC: rsnd: Add reset controller support to rsnd_mod
  ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
  ASoC: rsnd: Add RZ/G3E SoC probing and register map
  ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
  ASoC: rsnd: Refactor DMA address tables with named structs
  ASoC: rsnd: Add RZ/G3E DMA address calculation support
  ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
  ASoC: rsnd: Add SSI reset support for RZ/G3E platform
  ASoC: rsnd: Add ADG reset support for RZ/G3E
  ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
  ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
  ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
  ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
  ASoC: rsnd: Add system suspend/resume support

 .../sound/renesas,r9a09g047-sound.yaml        | 743 ++++++++++++++++++
 sound/soc/renesas/rcar/adg.c                  | 130 ++-
 sound/soc/renesas/rcar/cmd.c                  |   2 +-
 sound/soc/renesas/rcar/core.c                 | 162 +++-
 sound/soc/renesas/rcar/ctu.c                  |  29 +-
 sound/soc/renesas/rcar/dma.c                  | 280 +++++--
 sound/soc/renesas/rcar/dvc.c                  |  29 +-
 sound/soc/renesas/rcar/gen.c                  | 180 +++++
 sound/soc/renesas/rcar/mix.c                  |  29 +-
 sound/soc/renesas/rcar/rsnd.h                 |  73 +-
 sound/soc/renesas/rcar/src.c                  |  91 ++-
 sound/soc/renesas/rcar/ssi.c                  |  49 +-
 sound/soc/renesas/rcar/ssiu.c                 |  91 ++-
 13 files changed, 1763 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

-- 
2.25.1


