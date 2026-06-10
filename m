Return-Path: <linux-renesas-soc+bounces-33796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aYPRG6QWKWpfQQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:47:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E40666C0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=MSxaorKT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B317A303BA12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7AD3749F7;
	Wed, 10 Jun 2026 07:47:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E138AC6E;
	Wed, 10 Jun 2026 07:47:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077659; cv=fail; b=qC9vECjrNFeD0BceMu0Xfs3ndPy1HoG7gEDI2waCnHW6cDogyQprm74dGqXwdXu4Sgux5mATppyd48kyvuMPOOyDvYu7tFl00sl6B7KfELOvCrJ00Z1eyZcCLiChBbrSQZDaIElSdFoDtmxXFquJttsIkYzyk8c/omU14PixQY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077659; c=relaxed/simple;
	bh=3Hm4CURJSv7HNS6/ammgsrUPYmlApGbE6u/RgTe7EYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TvBtyVhZten+OSzr9i0zyKY6QV4biYmozQhzilkhNAVuKizkgbH8vC5dWwsvRsJxVeTUhLAKT7v8hgqIt9ZY9+kvgv+XHUk/C0kVBhJ/d1GYC5UsrJRI8y/ciLZWxfeMyVaUidgvmGVNj68IBMsBAMZns9/xnwzIFBIqyhYqw0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MSxaorKT; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4+Efb/grKR+zzTjhYWwTPKStpP/XXAhJZ/6b2+2mMj5pbzkodCXQNskiPRbN1QbMfSgWQePKBr9Z85DVEPNax4lEa3pc8BshPtZ9TBQDGuglOnc4kSTOsNlCTU30DAPsCJ9g1+o9d41BcwyTaogJXD2Ida3BwDPl7TIWpOuN9OPomO5Lc7xgIsV3NeoO8jrP2GcAzwVjalbTZybEQ5b6nO6VHSlCcCf9WJzceXfZcUWOuhDQfsvQyIX7xMRoCb1XYUtmGm+oDdDHzto9UfTg4HV/2/9bzkGNgjBCnfcZxlBdbe1+gPW/ENvVl/N1bk7U53liGVnjcmDbo+MITZxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEVJZPTu3uwHUZFkuSfe5NNGyaoBzXFTfNTc26+plKA=;
 b=ank16MPYalEKQ8Kgcizf/eEc+0Fv7mduZt0s/YxMhnMVxRPg+L6r2pEzBh98kgJhe6zs948/NUdIHmSSupYvkeoViD6xh0dnFycwdv093CkdojOBN+O+28eINXGQyy6Z87lKQYB0QlYKvbEUkLIrhDYlnJfMHGxwOhv9L3+N9WcV+fULzDATB2JH6rfycOLvpm1m9RPIviF6Q7qOr9TtttKTqfsihC5oIl0UkYR69aNybk+nV5oc55bresHuLNKK2fnZgISvhJtv5yaD92cwxUO+i53fBQFfD9IXImNpX/1LNylDX25TWi+6+MecAAJRIgtmYHmIiUxIOPQyZmyOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEVJZPTu3uwHUZFkuSfe5NNGyaoBzXFTfNTc26+plKA=;
 b=MSxaorKTJLtYKQsvWokLXzMsK+W7xHHdzIjLGdeAuztCN0zyDsSosetssNG+jVeDa2QmjEWs8Nggz+ChJxJdxJFUsgl3OZ7Tjqj//Tg5YQP3Ui4U6A/Uie8r2KYctJP5SRvWvQYkfypaAvKTTbkYIUKWpKeWAZn61aNxgGkCqnc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB13812.jpnprd01.prod.outlook.com (2603:1096:604:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:47:34 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:47:34 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
Date: Wed, 10 Jun 2026 07:46:59 +0000
Message-Id: <20260610074702.1743334-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS7PR01MB13812:EE_
X-MS-Office365-Filtering-Correlation-Id: 9679de5d-b091-4665-030e-08dec6c4886d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	05Nx83T+MZpysw1bzA14bGbr0Hagz9cfwB4cchJOD9ZPSXdFDQNPQx2Oz1OdtwMb6gS61NESPjSW1M18I4euvrV8iXQC/DU6D+vY+lXaTONUSv12zduVc1YL+UDod+pSNFMveQCye0+QJNSGatTKBjXzzSG+82o4QXsaHgCVJjVGN6bOwh159IfmCziwfa8feOVwajQCWuUYzhWM2VkDW+Nvk6sjYFXYdsXw7jJD7XOl8m18GAPwdPsVmYOvoZFtbKcfg1lsz8IpbFJO9pBY6ZZfwNyk9goPJpKQs5dsL3S7W4L/o4/NtG7KKMwTeouIwpSbM5nH3wU1TE9jqhMkAruGg/nNOxt5dGGnl8tFyuIjcyqg4OquLo5kK/CYU8qlB3+zy3tMEOKhPIRAuMIIDd4Idik6ZbgsqEgAwAUAJp37i2TfPbgxnWoEop6uQi1ro6HSSDElPJnCeTtsv0Ca2PxQCTi1QODp/MR202Npu46/h1nHXyPKWfAymSiIJG/i1D54HdDzIWtV/O+tXqKyLw3JcqdJ2XwfPasWFX++OO6wRQP59GeFHKgsjlTE7x+rVJvW5zXDxnhKvbB033PyzRgYYLCgCTIJB5euGOB1Q+BS+65ZzXEcYE3vzYYLoiyZfc8i90hzs3KZggLZDMm3dbLaH+gocdHnDrHZSVtEvL1v5UtQH/ltGd2LmEEIT23Naw6F8Zub8WYknuE/1bvOxFhJmxu9orytTMun4cGq4kX3Lid/XNUwd9hdLhbylt18
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pN5RWl5wPiIz9Nulx5znmmKYkz7rgpYZN06SUSBNzX1XnuObHOFTErLnDOw4?=
 =?us-ascii?Q?WQarris4UUfFYEFGF/orUpQN2x4UZMDWfDqlyP4TXL8ijr6Tp04nZtRZ9b60?=
 =?us-ascii?Q?0BnxNbRgG0BoNwCfyE2jGTeqZOUYUhcNmXcEX47YADz2fP3iABrRaGTCKnin?=
 =?us-ascii?Q?mX58gwEfQp9Pg/xWW5XO6Knb9GvPHpTLHfLH1t6J1hZ1LnSMHPOApy2wzcyq?=
 =?us-ascii?Q?FPfce5cuzoWIHKD/Ag4hX9uoS+LL/cOfB84GQ3+ds0IqlVqP0VlM8n1Z+w93?=
 =?us-ascii?Q?aGPv4TKF5HlHVRBItUx82t4sJaPn5ED5qpANSO9i9UXCKmQDLixlTnRTlq5z?=
 =?us-ascii?Q?5OurLnbQ1qxooz/QdZ2p2cdhN3j1nH8Ci61GKTyb9ChmISP/UrjCR3Cl8YUi?=
 =?us-ascii?Q?xIt7Jlx0WHiDZmElUeahxj/FBIYmOIrLEhqBXOCSxoG0Q0HNikdEsSiqC3GC?=
 =?us-ascii?Q?GKsY+tflj0tBiGaCkPiiZ7/wOEEDodH56r5+mbn4dQTZy6TDFFXbLrjXsMKA?=
 =?us-ascii?Q?zP4Iizy/Sh8HnEUM9r1LlXgOZ+vw/upAGRfp+bm+HGRTO4TzxVoI9S+SntdU?=
 =?us-ascii?Q?Hp2xjKzJtqkV5oc29cIsmrZfaiEC6O1CTYygpEajN9PTCF2KoIOoSGv8suab?=
 =?us-ascii?Q?TbttfPzv+y4vtNIM6LJx4wP08s6f3dVd3DzRCnbt/RmpccMG98y9j7QF+Rd3?=
 =?us-ascii?Q?NAWqYJhGkIJtE0NiUleTGmGBjrJy41uNBokbQTnO6re+9/miVF5j105tcHR5?=
 =?us-ascii?Q?CTZDkTvmumZTsQbKGLMCP9gjN0A6q358yiSL+obEXRTykRfKxahgdM7RAAmN?=
 =?us-ascii?Q?xfwX4S76jpTVCThhZNGh/UHtuA5Ws14Syw2FMoKme/9uYaAl5etwpuwj0XEc?=
 =?us-ascii?Q?DHBh7diYQH3tWs9alOAWu56ljnX5mMPyVLXW0Ho48dBlC1BGke33S2HbfcV7?=
 =?us-ascii?Q?EfBRzX44w+FEAFMjpRFAi7ShT9Sl2k99K9tTJ9/2A9LW10sqrT/We3jCq7jz?=
 =?us-ascii?Q?nquNhT0u3BeT7rRIg6wtFZZqyZl2CQbAl3n16NEkKl6BWw7AV7qiqZ6FRqmn?=
 =?us-ascii?Q?791f0zt452u0L95VcgI6P38yuA/YJQAQSYQE8A6Bdurb+vBc8sFdvCHY5oyx?=
 =?us-ascii?Q?tFGl/KfDQKfcyJ3d+vHjDGesNli6XxCu0XeCpFFfFzDCJrKyTdJjQTs4v0pV?=
 =?us-ascii?Q?NozKop58yfKK5OsgMKjalZLMVV+XMboKofzWXRmZ/yinU3P8BqVpsRCy4WA9?=
 =?us-ascii?Q?deQzIsAeJsfvovtdZcYCrdH6EQXtNZuVO9wAakm4EghAFEYzqpadmYPd36P7?=
 =?us-ascii?Q?HcChFXYreXZJ7bY66tjYzR+29sSD0cHFXxzUXV+H7bPiIoigVddU4yd9ONzG?=
 =?us-ascii?Q?4bWes84JS1nwePuOxVF1bFNXOZOzNLW04tk2U+pVLtXddqsLX1txbVF4Xaai?=
 =?us-ascii?Q?N+XymOy3xzhVwaQJmC/vvzigfDfsMmY3OG6PIjT356hzqNzBdxrWhCHyETMO?=
 =?us-ascii?Q?b9Ki4MqwkzM67mykV2vzjDfsW8K3aCxWKVApOtI9w1sFHMWEWTzVfPllhNlj?=
 =?us-ascii?Q?t1JakYeqHdxeHqXTNPE+umMuFKlb7f3fgNme/a2s6qO17MfJUiVSAMFshPXl?=
 =?us-ascii?Q?Hqgrv1G3M19+KL+BDh2QYcmK90RxL7dVWiX9aD1a+yRPgGiCBoAwyLvpwpxu?=
 =?us-ascii?Q?Hj3qsQznQf8ttIUfeCbGiUZIs0VizRdiQOnJIlxUMz9u81ZjVzd2dfrBttIG?=
 =?us-ascii?Q?7mpVubs4prbjerlEAl5TdHl/2ogpm6Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9679de5d-b091-4665-030e-08dec6c4886d
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:47:34.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8ECcke1rkF/0LdBEA1RVwfdg8LFOVuumaKNCQcvhR8QPI90DKIEAilDRcchpQDDBHaSjP0y/mEJJgX45M4SZyj27OrzTJi+PmbPBztxSMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33796-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06E40666C0D

Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:

- SSI (Serial Sound Interface) units 0-9
- SSIU (Serial Sound Interface Unit) units 0-27
- SRC (Sample Rate Converter) units 0-9
- CTU (Channel Transfer Unit) units 0-7
- DVC (Digital Volume Control) units 0-1
- MIX (Mixer) units 0-1

Sub-node names follow the new RZ/G3E sound binding: unprefixed
'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
the legacy 'rcar_sound,xxx' R-Car prefix.

Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
with repeated channel names, so that the DMA core can pick the first
available controller.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - Use hexadecimal CPG module clock numbers, for easier matching with the
   documentation.
 - Use hexadecimal CPG module reset numbers.
 - Lowercase the SSI reg size: 0x1F000 -> 0x1f000.
 - Extend the SCU reg region from 0x10000 to 0x20000 to cover the SCU DMAC.
 - Drop the per-line clock/reset comments now that the numbers are hex and
   the names are self-documenting, and pack clocks/resets two entries per
   line so each line lines up with its clock-names/reset-names counterpart.

v4:
 - Rename the indexed clock-names and reset-names from the dotted
   form (ssi.N, src.N, adg.ssi.N, clk_a, clk_b, clk_c, clk_i) to the
   hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka, audio-clkb,
   audio-clkc, audio-clki), matching the new RZ/G3E sound binding.
 - Rename the sub-nodes from the legacy rcar_sound,{ctu,dvc,mix,src,
   ssi,ssiu} prefix to the unprefixed ctu/dvc/mix/src/ssi/ssiu names
   used by the new RZ/G3E sound binding.
 - Reorder the clocks and resets phandle lists into ascending index
   order and annotate each entry with a per-line comment naming the
   clock / reset.
 - Drop the #sound-dai-cells and #clock-cells explanatory comment
   blocks from the node.
 - Align the continuation lines of the dmas property.
 - Fix the commit message: the node label is snd_rzg3e (v3 referred
   to it as rzg3e_sound), and add a paragraph noting the unprefixed
   sub-node names.

v3: Typo fix in commit description

v2:
 - Remove 2-cells specifier on audio DMA assignment
 - Do not update DMAC #dma-cells anymore

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 462 +++++++++++++++++++++
 1 file changed, 462 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 1251e329e380..048c22f80f8c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -912,6 +912,468 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		snd_rzg3e: sound@13c00000 {
+			compatible = "renesas,r9a09g047-sound";
+			reg = <0 0x13c00000 0 0x10000>, /* SCU */
+			      <0 0x13c20000 0 0x10000>, /* ADG */
+			      <0 0x13c30000 0 0x1000>,  /* SSIU */
+			      <0 0x13c31000 0 0x1f000>, /* SSI */
+			      <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+			clocks = <&cpg CPG_MOD 0xf5>,
+				<&cpg CPG_MOD 0x181>, <&cpg CPG_MOD 0x182>,
+				<&cpg CPG_MOD 0x183>, <&cpg CPG_MOD 0x184>,
+				<&cpg CPG_MOD 0x185>, <&cpg CPG_MOD 0x186>,
+				<&cpg CPG_MOD 0x187>, <&cpg CPG_MOD 0x188>,
+				<&cpg CPG_MOD 0x189>, <&cpg CPG_MOD 0x18a>,
+				<&cpg CPG_MOD 0x174>, <&cpg CPG_MOD 0x175>,
+				<&cpg CPG_MOD 0x176>, <&cpg CPG_MOD 0x177>,
+				<&cpg CPG_MOD 0x178>, <&cpg CPG_MOD 0x179>,
+				<&cpg CPG_MOD 0x17a>, <&cpg CPG_MOD 0x17b>,
+				<&cpg CPG_MOD 0x17c>, <&cpg CPG_MOD 0x17d>,
+				<&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
+				<&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
+				<&cpg CPG_MOD 0x170>, <&cpg CPG_MOD 0x171>,
+				<&cpg CPG_MOD 0xfb>, <&cpg CPG_MOD 0xfc>,
+				<&cpg CPG_MOD 0xfd>, <&cpg CPG_MOD 0xfa>,
+				<&cpg CPG_MOD 0x180>,
+				<&cpg CPG_MOD 0xf6>, <&cpg CPG_MOD 0xf7>,
+				<&cpg CPG_MOD 0x17e>,
+				<&cpg CPG_MOD 0x160>, <&cpg CPG_MOD 0x161>,
+				<&cpg CPG_MOD 0x162>, <&cpg CPG_MOD 0x163>,
+				<&cpg CPG_MOD 0x164>, <&cpg CPG_MOD 0x165>,
+				<&cpg CPG_MOD 0x166>, <&cpg CPG_MOD 0x167>,
+				<&cpg CPG_MOD 0x168>, <&cpg CPG_MOD 0x169>,
+				<&cpg CPG_MOD 0xf8>, <&cpg CPG_MOD 0xf9>;
+			clock-names = "ssi-all",
+				       "ssi-0", "ssi-1",
+				       "ssi-2", "ssi-3",
+				       "ssi-4", "ssi-5",
+				       "ssi-6", "ssi-7",
+				       "ssi-8", "ssi-9",
+				       "src-0", "src-1",
+				       "src-2", "src-3",
+				       "src-4", "src-5",
+				       "src-6", "src-7",
+				       "src-8", "src-9",
+				       "mix-0", "mix-1",
+				       "ctu-0", "ctu-1",
+				       "dvc-0", "dvc-1",
+				       "audio-clka", "audio-clkb",
+				       "audio-clkc", "audio-clki",
+				       "ssif_supply",
+				       "scu", "scu_x2",
+				       "scu_supply",
+				       "adg-ssi-0", "adg-ssi-1",
+				       "adg-ssi-2", "adg-ssi-3",
+				       "adg-ssi-4", "adg-ssi-5",
+				       "adg-ssi-6", "adg-ssi-7",
+				       "adg-ssi-8", "adg-ssi-9",
+				       "audmapp", "adg";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xe1>,
+				 <&cpg 0xe2>, <&cpg 0xe3>,
+				 <&cpg 0xe4>, <&cpg 0xe5>,
+				 <&cpg 0xe6>, <&cpg 0xe7>,
+				 <&cpg 0xe8>, <&cpg 0xe9>,
+				 <&cpg 0xea>, <&cpg 0xeb>,
+				 <&cpg 0xec>, <&cpg 0xee>,
+				 <&cpg 0xed>;
+			reset-names = "ssi-all",
+				       "ssi-0", "ssi-1",
+				       "ssi-2", "ssi-3",
+				       "ssi-4", "ssi-5",
+				       "ssi-6", "ssi-7",
+				       "ssi-8", "ssi-9",
+				       "scu", "adg",
+				       "audmapp";
+			status = "disabled";
+
+			ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			dvc {
+				dvc0: dvc-0 {
+					dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+					       <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+					       <&dmac4 0x1db3>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+				dvc1: dvc-1 {
+					dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
+					       <&dmac2 0x1db4>, <&dmac3 0x1db4>,
+					       <&dmac4 0x1db4>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+			};
+
+			mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			src {
+				src0: src-0 {
+					interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+					       <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+					       <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+					       <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+					       <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src1: src-1 {
+					interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+					       <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+					       <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+					       <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+					       <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src2: src-2 {
+					interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
+					       <&dmac1 0x1da1>, <&dmac1 0x1dab>,
+					       <&dmac2 0x1da1>, <&dmac2 0x1dab>,
+					       <&dmac3 0x1da1>, <&dmac3 0x1dab>,
+					       <&dmac4 0x1da1>, <&dmac4 0x1dab>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src3: src-3 {
+					interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
+					       <&dmac1 0x1da2>, <&dmac1 0x1dac>,
+					       <&dmac2 0x1da2>, <&dmac2 0x1dac>,
+					       <&dmac3 0x1da2>, <&dmac3 0x1dac>,
+					       <&dmac4 0x1da2>, <&dmac4 0x1dac>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src4: src-4 {
+					interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
+					       <&dmac1 0x1da3>, <&dmac1 0x1dad>,
+					       <&dmac2 0x1da3>, <&dmac2 0x1dad>,
+					       <&dmac3 0x1da3>, <&dmac3 0x1dad>,
+					       <&dmac4 0x1da3>, <&dmac4 0x1dad>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
+					       <&dmac1 0x1da4>, <&dmac1 0x1dae>,
+					       <&dmac2 0x1da4>, <&dmac2 0x1dae>,
+					       <&dmac3 0x1da4>, <&dmac3 0x1dae>,
+					       <&dmac4 0x1da4>, <&dmac4 0x1dae>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
+					       <&dmac1 0x1da5>, <&dmac1 0x1daf>,
+					       <&dmac2 0x1da5>, <&dmac2 0x1daf>,
+					       <&dmac3 0x1da5>, <&dmac3 0x1daf>,
+					       <&dmac4 0x1da5>, <&dmac4 0x1daf>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src7: src-7 {
+					interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
+					       <&dmac1 0x1da6>, <&dmac1 0x1db0>,
+					       <&dmac2 0x1da6>, <&dmac2 0x1db0>,
+					       <&dmac3 0x1da6>, <&dmac3 0x1db0>,
+					       <&dmac4 0x1da6>, <&dmac4 0x1db0>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src8: src-8 {
+					interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
+					       <&dmac1 0x1da7>, <&dmac1 0x1db1>,
+					       <&dmac2 0x1da7>, <&dmac2 0x1db1>,
+					       <&dmac3 0x1da7>, <&dmac3 0x1db1>,
+					       <&dmac4 0x1da7>, <&dmac4 0x1db1>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src9: src-9 {
+					interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
+					       <&dmac1 0x1da8>, <&dmac1 0x1db2>,
+					       <&dmac2 0x1da8>, <&dmac2 0x1db2>,
+					       <&dmac3 0x1da8>, <&dmac3 0x1db2>,
+					       <&dmac4 0x1da8>, <&dmac4 0x1db2>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+			};
+
+			ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+
+			ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
+					       <&dmac1 0x1d61>, <&dmac1 0x1d62>,
+					       <&dmac2 0x1d61>, <&dmac2 0x1d62>,
+					       <&dmac3 0x1d61>, <&dmac3 0x1d62>,
+					       <&dmac4 0x1d61>, <&dmac4 0x1d62>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
+					       <&dmac1 0x1d63>, <&dmac1 0x1d64>,
+					       <&dmac2 0x1d63>, <&dmac2 0x1d64>,
+					       <&dmac3 0x1d63>, <&dmac3 0x1d64>,
+					       <&dmac4 0x1d63>, <&dmac4 0x1d64>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
+					       <&dmac1 0x1d65>, <&dmac1 0x1d66>,
+					       <&dmac2 0x1d65>, <&dmac2 0x1d66>,
+					       <&dmac3 0x1d65>, <&dmac3 0x1d66>,
+					       <&dmac4 0x1d65>, <&dmac4 0x1d66>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
+					       <&dmac1 0x1d67>, <&dmac1 0x1d68>,
+					       <&dmac2 0x1d67>, <&dmac2 0x1d68>,
+					       <&dmac3 0x1d67>, <&dmac3 0x1d68>,
+					       <&dmac4 0x1d67>, <&dmac4 0x1d68>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu10: ssiu-4 {
+					dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
+					       <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
+					       <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
+					       <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
+					       <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu11: ssiu-5 {
+					dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
+					       <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
+					       <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
+					       <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
+					       <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu12: ssiu-6 {
+					dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
+					       <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
+					       <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
+					       <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
+					       <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu13: ssiu-7 {
+					dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
+					       <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
+					       <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
+					       <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
+					       <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu20: ssiu-8 {
+					dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
+					       <&dmac1 0x1d71>, <&dmac1 0x1d72>,
+					       <&dmac2 0x1d71>, <&dmac2 0x1d72>,
+					       <&dmac3 0x1d71>, <&dmac3 0x1d72>,
+					       <&dmac4 0x1d71>, <&dmac4 0x1d72>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu21: ssiu-9 {
+					dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
+					       <&dmac1 0x1d73>, <&dmac1 0x1d74>,
+					       <&dmac2 0x1d73>, <&dmac2 0x1d74>,
+					       <&dmac3 0x1d73>, <&dmac3 0x1d74>,
+					       <&dmac4 0x1d73>, <&dmac4 0x1d74>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu22: ssiu-10 {
+					dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
+					       <&dmac1 0x1d75>, <&dmac1 0x1d76>,
+					       <&dmac2 0x1d75>, <&dmac2 0x1d76>,
+					       <&dmac3 0x1d75>, <&dmac3 0x1d76>,
+					       <&dmac4 0x1d75>, <&dmac4 0x1d76>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu23: ssiu-11 {
+					dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
+					       <&dmac1 0x1d77>, <&dmac1 0x1d78>,
+					       <&dmac2 0x1d77>, <&dmac2 0x1d78>,
+					       <&dmac3 0x1d77>, <&dmac3 0x1d78>,
+					       <&dmac4 0x1d77>, <&dmac4 0x1d78>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu30: ssiu-12 {
+					dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+					       <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+					       <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+					       <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+					       <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu31: ssiu-13 {
+					dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
+					       <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
+					       <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
+					       <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
+					       <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu32: ssiu-14 {
+					dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
+					       <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
+					       <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
+					       <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
+					       <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu33: ssiu-15 {
+					dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
+					       <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
+					       <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
+					       <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
+					       <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu40: ssiu-16 {
+					dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+					       <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+					       <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+					       <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+					       <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu41: ssiu-17 {
+					dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
+					       <&dmac1 0x1d83>, <&dmac1 0x1d84>,
+					       <&dmac2 0x1d83>, <&dmac2 0x1d84>,
+					       <&dmac3 0x1d83>, <&dmac3 0x1d84>,
+					       <&dmac4 0x1d83>, <&dmac4 0x1d84>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu42: ssiu-18 {
+					dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
+					       <&dmac1 0x1d85>, <&dmac1 0x1d86>,
+					       <&dmac2 0x1d85>, <&dmac2 0x1d86>,
+					       <&dmac3 0x1d85>, <&dmac3 0x1d86>,
+					       <&dmac4 0x1d85>, <&dmac4 0x1d86>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu43: ssiu-19 {
+					dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
+					       <&dmac1 0x1d87>, <&dmac1 0x1d88>,
+					       <&dmac2 0x1d87>, <&dmac2 0x1d88>,
+					       <&dmac3 0x1d87>, <&dmac3 0x1d88>,
+					       <&dmac4 0x1d87>, <&dmac4 0x1d88>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu50: ssiu-20 {
+					dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
+					       <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
+					       <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
+					       <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
+					       <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu60: ssiu-21 {
+					dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
+					       <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
+					       <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
+					       <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
+					       <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu70: ssiu-22 {
+					dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
+					       <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
+					       <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
+					       <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
+					       <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu80: ssiu-23 {
+					dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
+					       <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
+					       <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
+					       <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
+					       <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu90: ssiu-24 {
+					dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
+					       <&dmac1 0x1d91>, <&dmac1 0x1d92>,
+					       <&dmac2 0x1d91>, <&dmac2 0x1d92>,
+					       <&dmac3 0x1d91>, <&dmac3 0x1d92>,
+					       <&dmac4 0x1d91>, <&dmac4 0x1d92>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu91: ssiu-25 {
+					dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
+					       <&dmac1 0x1d93>, <&dmac1 0x1d94>,
+					       <&dmac2 0x1d93>, <&dmac2 0x1d94>,
+					       <&dmac3 0x1d93>, <&dmac3 0x1d94>,
+					       <&dmac4 0x1d93>, <&dmac4 0x1d94>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu92: ssiu-26 {
+					dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
+					       <&dmac1 0x1d95>, <&dmac1 0x1d96>,
+					       <&dmac2 0x1d95>, <&dmac2 0x1d96>,
+					       <&dmac3 0x1d95>, <&dmac3 0x1d96>,
+					       <&dmac4 0x1d95>, <&dmac4 0x1d96>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu93: ssiu-27 {
+					dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
+					       <&dmac1 0x1d97>, <&dmac1 0x1d98>,
+					       <&dmac2 0x1d97>, <&dmac2 0x1d98>,
+					       <&dmac3 0x1d97>, <&dmac3 0x1d98>,
+					       <&dmac4 0x1d97>, <&dmac4 0x1d98>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+			};
+		};
+
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
-- 
2.25.1


