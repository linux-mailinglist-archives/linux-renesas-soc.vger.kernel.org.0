Return-Path: <linux-renesas-soc+bounces-30944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO9yKFgl1WnK1AcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:40:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF83B1274
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC8263076D70
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3823C0603;
	Tue,  7 Apr 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Im7MXH/x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1703C1994;
	Tue,  7 Apr 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576133; cv=fail; b=EWBqj24tkeFNkRD8jZZosSFa8hk3ULHD/cF92LdBlgAfDokHrx5FmRAYK7wSUF7AiupSidh3agB+oK6JhZBjYvVmHim2SiEoCV4aCR5tnFmcJUTjZ5ha/r3d9rKgBO/cLPCCGUXHESkD5vhE5YrB2uBOZaOdaHaGazQLEiFk8sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576133; c=relaxed/simple;
	bh=dzVVoFGxNrutq4uZXhmXPPk+rtrgIXbRLIbLvYjPY30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a7ZzMy6b9EEATDDQVg9tz5xFoc15Kuy52VM/Z+2j0rJWLkhb0DXOX9PZEjXRnsOAVmwlg6JZbIpHJYbWheiG8LNUPkxC8Aexmju+HTPy1+tiFcxvpX+5K7fK9bTxuCOcS++TDB+BWIE8l1Y/Bqa4kL+NXlkvTh6VTLdMYV+BtvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Im7MXH/x; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA4yLdYBPk14sIoPfPTenDl87pNGqGinOdeKZGQ6Y/ffKZM+p47O/o3C6cPHKawRbqSvmod00j4Ie8Ic2mrDBL6y3YBP05wk2BGUw9cLKegyquRXpfjJfcr3sh5Yn2opfzBYjpLP31xDORdI7FAUd8j16Vj6Is3SGZonxqBt3jNT5GHD7WXAS7ycFnBvoTZdRRLrSwdvQmQWZ8dzJ+Tk34DwXaLppfjk6NFX5msAx+N1flhwwJH5hGpXAb9u0brTK1KkOTFI2YikY+rzKo0uA5HXYj6YX/BLUJvstrohwyOKQCkIjKTTmhU0udvgnV7V16fixFDoWMRyi/YrW1HIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgedDQPrDGHfohi/FuPwpcciKBPIVhhkH6E5CvJRR74=;
 b=dkBuc9Sbzm7V++SIbNEneAzNkSRp/zc4M+dAzQnzBopwwDLEFrFHIA7OP8abwWSyYBCSFQ1cJhaWtdnHiCZlzN0OLDVXJvsiYfyPnv7Tej3kORADthlz3D+y/L4+CDO2GXXaq/+1slb2b7uwSQoZqmIavgext+pg66aUGGdO8Mh7D3DpuLzDNcA6gWk/OtBtth1XLEsiZfDQacUWWGlTHmoGOG+PbIP2SgrlWVvdMAeRVxKGZ1rPIn3zcyeAx/vrPZDKUT4eMIvUZQG5sM6RjE4+JsEBn4AUkX2b25YCzQilSpWqycOIWtIykk3jQEgZNW19NnRgahjsJTzR4n+d4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgedDQPrDGHfohi/FuPwpcciKBPIVhhkH6E5CvJRR74=;
 b=Im7MXH/xgQoRgSAg/MgcRmh4zvxp0yviXdRV0RkOCXF4XtVz8tVHYtTtKR+RwpiVKSf/PX6ht00fCIOAJHyn0oGdCbnvsW9ndnIV/9NQEAzj+cwjV4ybLnis29gv/0Q92qb3fnklVVzAudv7HvosI71/LKeRWYKHNXIbCGuZQpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11104.jpnprd01.prod.outlook.com (2603:1096:400:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 15:35:17 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 15:35:17 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
Date: Tue,  7 Apr 2026 17:34:28 +0200
Message-ID: <22fb9a500cdbc3272dc23cd5e36bca5fbbec75fc.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: c99103b9-1391-4693-3b02-08de94bb4527
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	v+bnyeSdGzMcdzPWiSfE5IzDeXTc1asA9UqWJf2eCfD3pWpAmc65xIKf3zPhFKHqlhbIyaAWqKrEhXeQG+S6g/95/i5YPcliHYd+1Y9PAf7efD9OwudOhwGL3tG1YktQ7XBMeZL3LY7a7gjuhpOKLJADwiuxBG4k7PDLaft5vGekxtw0QHb4YqBW8l/G5bB4lYou+lGGzfOGw1HrQr9F0pE9hYKVCWDbouiA3zllaMuFcJ2xVSfHXqHg9fSHyiYLuS6ZHlJcuyEwr/bEGBJoYRIvjus77mPcDsVgPmpPS7n3P3p+i8Pkrc9onw8Ygx6lR23pAxm34jW8cTbDBhTsqSdEQS70kCOgyroYhDfgaFZ9pVB/iw4FyQp+ZHyUB0n3L5JjIHbKPVEvBQByUvpCnRuTSsL9HL8U2Aq4f50ySjpk5vM08QMh7wZHNGsPjB+jJ3rGoYGzBcmrDzCRwrUHwpxFQ7yueGGbjQTuRu75Kwb3v83p4vSz4Ubf4QseaOpQAhhDtPRFzLh28S02Nr3rUosxID2m/CgnyrEYofN4sZOGOjLEkPj3RK1wiY/YtN/vlFcBCE35jyV2apNTsAym2GMfyc1tuTjRr5iYgv3WEw1aAUzdIt69KA+mopTu9Qm0Z2WgAK/VrZ39n5/6oJhSdxt6LBrWqQSVzRdmYrmah2Tcp2yoVg/WwDTC+3yjjfDlqPIUbUGT/2rVJj+KeKyz6BNsBa5kajQ61cORfjkHvKWWS4EmYnlnmHz5UOr6WB3NNyO9M0dg8e38qqbmQ0n2Yd54xCg4AcpEIuaUL82RblQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8EiDdhqelLQ5bo8YMu4Ie6iYuyjOUSs1xZn+xQ4CI+hRNXmcEAqhuaLbk44Q?=
 =?us-ascii?Q?amQvdFbtuP67uCQEgigR7oDsbilSeJUkIN2f9Z8hOXbDgYRa5DNG6/1/ZsA1?=
 =?us-ascii?Q?VPyy0GpZ9yqM6bVfD6QiUSP/zykqNNtDNyRGTliDhwViWPKES02RzxvFxh/S?=
 =?us-ascii?Q?pxX8CasU7UyZTS0eoABZS1W1ghLbNv7zA7jAWckxmPcMWCtng+Ybtmycoq8Z?=
 =?us-ascii?Q?+OJ30BB7HzCgQnh64JaT1OzCp1CRVM9cONjFJbeIAa79BNJ/p6zQqcIRfiEn?=
 =?us-ascii?Q?J35KrvutfXq3OeyBAmp1Q5u1DyQHibK4M9w2APlEMJLYewEa60q++Kg+sykS?=
 =?us-ascii?Q?MuxZXfkEOgfEX9KgDN11b3Q/+YxNgAJ5aKPB16F3ts/FSAqS6tzqoSYQHZHj?=
 =?us-ascii?Q?/2dUpOjx75PJm7LLzYfEdbehOLljhL2w9Ydhtp/E5Fa3jYveIkbmBfZhr2GO?=
 =?us-ascii?Q?ATVnyHv/XKtWcQgvnH5RjvAmmnIiky1SdnT2FkW24WirX3308Cf/K5zsjVyf?=
 =?us-ascii?Q?J7rSMUGwTnM1kt0V1ApUrdavIe+A7LG5kb4zl7u0wM1dVm4GmL7M9nHQrKU3?=
 =?us-ascii?Q?oHqNFDqMCCmJy5vyZm3Kd5EzBs62/TdoYbkiVm/0EjQSNGwtcsz4mBtUQUxk?=
 =?us-ascii?Q?AuAyLJQ/NPr0/pxCaXMp8oX7+/zyF8jrNgz0ghnN+Vj5Q3UvHL/5NTvxx8KU?=
 =?us-ascii?Q?5PdEChCILOmY/l8SDJ+4FhlLHi3pE3z7AaDiu0wuG3VICBhT+iE6q6RQ42NL?=
 =?us-ascii?Q?LIc0ZOxXVxNeBQvtEqUGZf0SsdwpA2sqElaZcgVKT8TzjamPWcTZuXQvFljT?=
 =?us-ascii?Q?miXCMYrtIN3Wb8EO1VmcNvUcYMYjb2bO1SrWGPZtJeqSZANLynW94YKFaHn/?=
 =?us-ascii?Q?giJnslsyfkPqMmCUHCKljysL/0pqzvEzd1gyAmhuzlzD09vkDBDfeiZBeZ4p?=
 =?us-ascii?Q?Du62QObgdG3lTe9FaYyfqksktVmEyFXwn6uvWjQ3p7IhhGfBEQTNn6WQbJ7y?=
 =?us-ascii?Q?i10Iik7Wx2n+I0b5kHElbps+9ONSdRbPVuVtDu0pvrh0rwc1GaWiyHfkY86E?=
 =?us-ascii?Q?EVO9p11DIitnBCKE4EwH+TlSVMMC5xrLelLdQrYmwXMKEuy6IyFgeYqIFVAV?=
 =?us-ascii?Q?3cMuwF8Gh/P3LbgBnZsp9zzAbSB2/EmRo3y5st0x16vhTdFFgIjlSbTDLIzf?=
 =?us-ascii?Q?4tZNRGSiShrZzG/4HsZu2GMd+z6mhyob/ct+4PoczKsjY4ECfY2A2oxDUCj5?=
 =?us-ascii?Q?6nYkMl99FeVdUuuIoYubwwfOJf/nVVGXHJ9/Y9NM25CFRiTqCvjRkeo/dNcN?=
 =?us-ascii?Q?5qlfbaN3Ky2EwGwsoomD+WUSXbxbzkjY7q64ouy0rdbNG3WR7IGTIvN9s51W?=
 =?us-ascii?Q?aFJSjPwzQoEuUmSJS4zXTcJzZY8mr6prN51+MWWWwrCOitJQ+2MQQ2qJhqU4?=
 =?us-ascii?Q?TcNIePqmTnzt2n7JdP/H2jMfTUpRWbEaSkwycTdCRchJ2mcXDIaYr833J+sx?=
 =?us-ascii?Q?nvgmHE2tub6PUn8LtJXxHto6qDU4lD2oiWV2ArPtJ+QN10BdYya5o7amQIMf?=
 =?us-ascii?Q?DjBTTT959v19c6DNAK4WqH4TOpQD1BMoHM0okTbYeY/ssaeoamIZbIeU8AI4?=
 =?us-ascii?Q?hTXJQ843Z+2XBCz4dtGQwHKC4VkUEtsRjtxTrAZCSJ4zotOqUeHV8YV9uGcD?=
 =?us-ascii?Q?ozrCaC1dfCwDSQs8SZTPLhr6FUazYBLqgl4S7rhVKEL78Z1eKQXNzKig5+Ng?=
 =?us-ascii?Q?yLHed+VNzRJFBAAhTDS6QTazjRnEw3elXNcVARG0flvwwk0Tq0H1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99103b9-1391-4693-3b02-08de94bb4527
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:35:17.4635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiD8fNQjNeE1V6jG3HEPXswPYqfw3Xkm91KSYtn/QjMmhWsIQrx+F5LmP9PJLOw73UsSgbFcIWuGmV3qnlIcFo210UL5UI0UX8DnFUdhPb+vkKgwE4fMBo48h/ADF/C7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11104
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30944-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.241.179.0:email,0.241.139.240:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 1FBF83B1274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
as a required property. Add it to the usb20phyrst and usb21phyrst nodes
to fix the following warnings:

"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"

Fixes: 6a1b6f7e56dc ("dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 9581af58024e..6f6fe5f36bef 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1345,6 +1345,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
@@ -1355,6 +1356,7 @@ usb21phyrst: usb21phy-reset@15840000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


