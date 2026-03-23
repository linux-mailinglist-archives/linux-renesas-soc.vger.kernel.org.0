Return-Path: <linux-renesas-soc+bounces-30086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNhJEASywGldKAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:22:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B42052EC2B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 144D5300AEFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 03:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9A326ACC;
	Mon, 23 Mar 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ks70U8vc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA814A8B;
	Mon, 23 Mar 2026 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236082; cv=fail; b=fshWn4BwEba+E7myn+8EdvvS359qTkwo5KBk5QTtFQ6LXAagEAOSLp+EXHknBhi9IVXushWfxDndpNkTfbCpnHmOtRilPsj8XQkKuTmThVKgKe7UwUnxgteIEbg0tjcmD6jNxKY+lkDmNqaY+67F0ANH2RVBgv/Eo+Yflw/61M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236082; c=relaxed/simple;
	bh=vAja093PgubivNgp+qh8EnHDhsTs9+42i2CUSIMHCks=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qbHCLdCgwjWxLS6jNXSQy2lacid9VMX0a76wv+uKrQh/5sZbqZf2wL0sW/FT7gGy6HgZCjVs1vnWovbCkbLEwcGm82duKxzy1T4v3O/5I4M5diUJVS8/mz23X12tAdsya5TpUOMIYX7kEjKuHReS6beRsSwvFmi4h7xrFT0kc8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ks70U8vc; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXXNGXjZ0ingZ9fsbx219SgdV3cJwsSFNslFyHbkiGf9WKiSACKlWnBcO17ddVnvS0ksqZxW5Hj7TgzzkJyTk0Y0UMQqZbovhK40V3SIvuQ+YwxI2B6AxjTbJ5yokTy85S0dKXmY00IHryQ6G7DsNAe4RTfCbUkQELOw3nSdwXusI92RTlUBzu3jd/Pe6MDgNlNcqaH0SJByKaIAWkEraqORIYk543x+UFW1dpq540xp5fAYf3ybnwIDnzNXz/CaR3f5Kqb83Mg+HQJCh2DNl1tOPazveNopfl64p8Kpo4sGrFoT+yBCM3ibD3y51/h/XNqhdoST/oy7OvKFH721rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpl+4g+DDTjl3zjdZKHbq/gDJ4YscT8LWgFqpuLvceg=;
 b=vPrQqXHaUYD65ibVOzt4vgI+Q2PvhiDr/DzRWhWJY/Xq6lwN/WdHwFPPUFwpuq58T3jv4z+sPxfbTArXaMpxyJ3pHSYwwb+7WGRxG6f2wOcakRgI4jtf5vyCDpaInfKEIQZXkgH57LC0u4GYxLzK3m934ApqZUFmQrXznMsj2oXn+rRDNZOTgNQvcLB0AFZmStnkv1Jdg7WlGqX+EtEsbtGBtOd1PkNUlkcSZsHgx+j1iqS6BnYEx3WDWZn8b1zOKyrsiTzfloHWXGR5T0aJKOrkia6FCh+wLEC0otlO5QqPEiMT4rhyjCNyJYFhElJBoiBUKKlZ41rv6alNFpO17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpl+4g+DDTjl3zjdZKHbq/gDJ4YscT8LWgFqpuLvceg=;
 b=ks70U8vcW7TjHvnR7BKwdeR1NBT4Ht59U7zlivWY3seffgFYcpL0W79d2LDkAYmq0uAgg2RU6Oh3MtkPQREB5t5OTCXwyFT0/Oj+44gx8IgrlCimtqe5IqX1TftOQSl3/mB6eyMR3NCWbhSaMuavbAuQRp57RaZfNFkhBKCFcVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYTPR01MB10922.jpnprd01.prod.outlook.com (2603:1096:400:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 03:21:02 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 03:21:09 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v3 0/2] hwmon/pmbus: isl68137: Add RAA228942/RAA228943 support
Date: Mon, 23 Mar 2026 11:20:55 +0800
Message-Id: <20260323032057.953-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYTPR01MB10922:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d8f6fb-4418-4f85-93bb-08de888b3a30
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SXOmR57v/EQTKDR7UC2ThcamPXmK2fLKgw9gcD/F7wGf8Ilq6+ZFqz+jlxsmtQEw7QwKG54iIc1PPdtGMwkasWt92cM8j1T4VLJyb5Imy/1x37RjnCSZYHyixTQ+IMRVU6i1ho1CpH/uZmKNzlfUw8iSuHB4srFTIL0hMTctGNL6qbCJz74X7QkTgEn9t4K7d84U2dl4HyxLMHOT3ApG5m/YGyW+feYyorDt595BJ6iMM5Vv/6rGt3JYTHucz1PAM411+2A3wdc9QRz4FRadhWJlmb21yti4VUUfXHUGJWAC8xJjgkYioA8R/Mg0pYqRsM97A4tpooMdx68hvxbJL9gFLN7HoDVpaGdxl0DWSSwcckBgxRWtR3uMjMZTnulooKWslEFLAK8qma28/cZ18BvQdC15jU2r4J6PdwhKmsklwAFxk3O1OWw6fntY3IP/ULDmzvnw/vCOnTjHC8JM6fiUEJT2Paoqdr0RidwfR1cAj4wFsFndTetDtJL8B7ORRvd+cYn548mc0MfWOgx1ZYf4kI8kYW93Dy29BDQW1t3DSTmsCDKy+uYcGgpjllQ4X3t7GQOGGpUiH80cH8N9gtWZP/7GP7xWq/nWCvatNrze0U5x/OIv+DEmYufqQnppJcKNp8AMCs9/I13E5az6cKoY/4EEl3G2aZIZbfWCq5x7OEBMlsbE5Y070x+k/hIyMxw24M8Ib5djBhgyMURfF7YXATLwsBdc9o9ZZX+649ZSCQYPIJnW8qcaXiTbIJYsCcILPkEowMwpp3mt1AdyqeWDPZElKXPVClHPjZG20L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SIxcssVHm6xm8ot0LIDQ+Isn+iGYWB59qPoP9GMX2VX9G/QWtC9edysJ0AnL?=
 =?us-ascii?Q?hyjdbhLkWokwhSNDoS81QYZDNBU4aflnv1lHzEjTFT27oXYvEc8v9HUs6+74?=
 =?us-ascii?Q?2mEh42xDpdu1oxe/UTulf/03K0Y1Rx72SyJfnumOfnIEtUNijXdK8raRDhWT?=
 =?us-ascii?Q?TryCp3tOmIqml3Bgr4ZqUV671ecFbwqOyX0hQPiN6HlDh8cAPgEw4nt8UD47?=
 =?us-ascii?Q?hy/z81j6Dm7nQWEWozmqqjum7csjTbXTQ5Ec31tLfrMxBXT3VhVpQX/Auhwa?=
 =?us-ascii?Q?UJ2zPkxxVP53GjQBrzb6DGH5Wb5/+xVi0M6M228yJUqQ2aqVSqmEP/ySAj6K?=
 =?us-ascii?Q?sIulRtowP6qoNRQxUjcsWK491XtpfENwqAtGFTVxVwwyT7ZeX6K+41Oz1ROn?=
 =?us-ascii?Q?xlZODfwJFBYA/9gumUaeNqVH4qODff2z8Zuhok6St08Wfcp2J59TNt54Ii2p?=
 =?us-ascii?Q?IXMKgbJxMOBwxikt7PkwjUQSi/tMAhx6ST0Q18k7gUkrOTc35M0iI/Da6ZFt?=
 =?us-ascii?Q?3VsNVaJR/CKlnSuAzZqggu3OyS20jtiP/25hMnZKWwedORpYq2wrl1qbhjop?=
 =?us-ascii?Q?xtVUAEzwjB4pbc+VoLeX8pom9Ls2kqlPxMAdC9FL4GasISop4ynngSy7l08K?=
 =?us-ascii?Q?GPEcmG51xiHaQEd0cty956MdrCS6reGGBP5bNg54QrxvxhXVsCGArPVnf0uc?=
 =?us-ascii?Q?tGQZ8noRwuSrfMda6W/Upz5APelaMAfHayi+tSije5RSgElqtrkV3G7xB2fl?=
 =?us-ascii?Q?48kA1Fa3taHHYEFll83b0japUv3o+h2mdnNYNx5RrEDRj/8hVauRKtw2z6zy?=
 =?us-ascii?Q?fvVpxQ8NFGsiO274gMcvAJsH5E47oo0KeU/33CuOfTyc02Zw9Fu++RJTKdFd?=
 =?us-ascii?Q?Hlt/K9t4cqF8rAFqQvy7VT3TTzpbX0fQfW5AzszYIOjOuuVc4VCJDIgtyKBx?=
 =?us-ascii?Q?s6bG9/xCCVgINEx7cL+44Y5w6efEu+JV6p8NHK/nUexLAAT3kVMZcC5yIbi3?=
 =?us-ascii?Q?udtfap1zNNceTse00pp3jGHlC5Pn33Uou//eUASmAyz7duFTS9s+pFqP2T8C?=
 =?us-ascii?Q?P1d+I6HIgqtfLQ/fcmk9MyHziGeKFjwvPMOuhz9G64Qt70qJcJ+lxaxJadWv?=
 =?us-ascii?Q?r4w3Z9VO2tGe0Nd2mgYwnIhPyJtBxxNiTkae5n5vC5RELnlxwXxSg5koX8Os?=
 =?us-ascii?Q?CtFl9HsvbERfwIu0QgS0aeq1teUKSsAUhkydF0VIOzAYXLafSCwhd62KJe71?=
 =?us-ascii?Q?IXDBzFjaA/Zc4c9eXpXVYdqDcbhWfu79mAOx7PSRyOrysrCtO4S3Bd5hd1+s?=
 =?us-ascii?Q?H7RPqMyIdep37K8idWU0MkOtpBJSngnkCK9yck/MQ42lnDzoUyzq7zrEudMj?=
 =?us-ascii?Q?OMhnE2RiYIRw6Gc6SOAtAFH8HLPclx5IQsMkJkiRYdSBklrfNsiWfU2ZE0Py?=
 =?us-ascii?Q?2ns6ybJzoshA7K7Ut3MhDHT8ypbd7vTR5m3tWGCxTbd1BMKY6WPD9SV9j8Iq?=
 =?us-ascii?Q?bdISzIT7fNvywNlw7kkChh6EOufU+l4CEnhqCb8qy60mEaO3g5lU30ISal80?=
 =?us-ascii?Q?UsJ/9biSO/1/++S/xJRc8ipG1lm0aJFwlM/z5VKvHrAhx+tciaBcOr8xTR+k?=
 =?us-ascii?Q?Csw21+q0dP+jgiDI9dUDZVeLfLOenLEGO6uwUBotHKu8MPUr38o0y95ojwot?=
 =?us-ascii?Q?WFYz68LHsLj36yGC6waXIZgJRs87rsg9rp3H5huqEWG4hcv06+R47ewABbcs?=
 =?us-ascii?Q?zp7NmT8sRA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d8f6fb-4418-4f85-93bb-08de888b3a30
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 03:21:09.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cg3N3BZXLIbuqpPe9tb/4YGg1DHzYoHxK2mOQamD2OQ6u4FrcHr4dltuflGh730eQFQzGuM3jqyJuLJP65fhBSlj/BEcvDHUXn+uGg1dxUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10922
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30086-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B42052EC2B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Renesas RAA228942 and RAA228943 digital
dual-output 16-phase PWM controllers.

Changes in v3:
  - Update commit message to clarify hardware differences
    (suggested by Krzysztof Kozlowski)
  - Drop enum cleanup patch as it has been merged

Changes in v2:
  - Remove entire unused enum chips
    (suggested by Guenter Roeck)
  - Improve commit message to clarify hardware difference
  - Split enum chips cleanup into separate patch

Dawei Liu (2):
  hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and
    RAA228943
  dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and
    RAA228943

 .../bindings/hwmon/pmbus/isil,isl68137.yaml   |  2 ++
 Documentation/hwmon/isl68137.rst              | 20 +++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c                |  4 ++++
 3 files changed, 26 insertions(+)

-- 
2.34.1


