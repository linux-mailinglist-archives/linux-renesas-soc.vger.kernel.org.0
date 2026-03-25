Return-Path: <linux-renesas-soc+bounces-30207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMAwKtqkw2lssQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:03:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B5321D2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1087D3031AF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8430C339853;
	Wed, 25 Mar 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A7x4l9U6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93763290DE;
	Wed, 25 Mar 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429383; cv=fail; b=kQj1YyiKa+cNrPTMPc/ounWJugaA8UepkuPjT0nABBW8Tf3knY2NfqoODsqetS/jlWki5N+PYaEB3jQL9WdagPZOaamwQgRMyx8F+zchTGozxyZV1k3Svf8HNxf7xA16cbQnheO0y7O68wZhDNwcjMadukf9RUTT7/iM02NzNfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429383; c=relaxed/simple;
	bh=M2yiryAv1c6xFRAjI4AnSWY2ElJsJif0H9txp37g0ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVD9ppwz1fVU/+8BuxKdPpkW7491ZDyyP7dQtkAW9vSahSEuPKNZQLnwcLpcqhEs66qBLk2vGWwI8lOr9f5ZVtdoecnizdqYVuClwfpDvqTNueQ7jWwDjZkOPhkrZuQ6SSdiUiRkeYR8oDXUlP1XsfOtK/ypTHXbbBQ2lP3dmT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A7x4l9U6; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xd2X/RmhB8h28QbiRDVWPzl3VUduSvmVFinywBd3HHk1N9RKHlOLxam1x8kdWwPjOc/EfzZs+Repa24aZGB/2kB67QMr9P5KjqG3sJLPFE/1Qvjmo2tjCK/Fa/eVEFq379+GfNhahDThnLAuS2BzbRClgfX32RwpzlBkbR7LqioIK44p2aHK7UzrunRwO2TZHoblm6WJlAfgw46hk6Xb3T8oRw+9dI4pAtq5OavKscKnO0kXoGiFgnIx3aiOOHGGiM0+1onSoJ/lxhYeQLO1SHbmPcFEgPpCJXMEhC6AXLMhAoFekQ7ohm5uqIi/a7uGvhowiEolNm9A3nK3I3IO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF9GN7BH+Cc827V71aUlqtRcEnF7lYxaCr8xMwObjGE=;
 b=pmEF2FYkJ8scnKLMtOpnqQrMMbPDfiQ9U3hJm2bN/BkjbalgY9m92+lyAMs1voJrxb6xli5LU09v9pOEzndps2f0z0PGB+ncefY6zdtbCK1HJaUe37kM8siJ072oOjHWZs/ht55TMTNNko3FzQD8tsgaO6qJ1K6h3ISECpxCO53+p6AMDWocvAm1qgNsJXVvdJPq5GsgHkVWfNwbcxjRn97yrJgEkPlJ8qQpHE6DlWcLyLNt5/F4vuH45hMT2glEr9LI5Pd1ooLCpAFSLPdNW3JmPm9hvPtHhidFX+zgBm0R4codQDQUvsblGKXj2Pcd/WNwTFwAbWFOYJmeFYRgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF9GN7BH+Cc827V71aUlqtRcEnF7lYxaCr8xMwObjGE=;
 b=A7x4l9U6hfS5oFTtjHZVFh4rYTpK8Cho4PZAGzRsxA5Ut56BKNHxuXG6urEGbXzfZe8BMM/bd4lccc3wxX/emd3SbN3obGyz+hJM2PejYuqs/TSiPWcvazPjZQ2SDqzjjVzJ/pQyscJnQvWevH/2HBWIFFmTKvXFM5wTL2ZPID4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYRPR01MB15433.jpnprd01.prod.outlook.com (2603:1096:405:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 09:03:00 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:02:59 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dawei Liu <dawei.liu.jy@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 17:02:07 +0800
Message-Id: <20260325090208.857-2-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325090208.857-1-dawei.liu.jy@renesas.com>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0027.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::12) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYRPR01MB15433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7316f934-4fb1-425e-f4c3-08de8a4d5042
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TqKNblYLSvYxLznMq45T8PV+W9pv7qa7yKnl9T1rJITQa5+UfiJ6bfyQZd55XJ4Elw+/+cz7EIPzCdm63QmAAbcNFjlMYSVx6okyTB6g+xjSQ0hKTh8lJ/OoWkqDCekiYXiUBeeh6GSUHGTuF7nmR9+YSaQSaadOdigSkICYMEHP+LLzv/t8PUrEiMhKhLquqrpjHHmrVMzo9XiLAVYGISdYyxRzK5ufhHb8RBqrAKH0aGQb65B8Po0bgXxJw9WfwvSxLQ8jNVDJ5tcJaIVXuSIC+2/iEzi6V1hJyw3tJulW9Qz2+Kl+KeLLe2im4n5Ypx+ZT0ktezRHy7oXPT8UuVMMlnw/SAkMDl7Fb9lHWapGD88qmVps3qPZyoxsRYUyjjJswwhVi2Qt8vZBPwWmLsDFC9kzDOIC4+8cN2TxHQqdvXkqKO5lQuLYI8SWCREOaqI9qc6Q3P9XLS85Aba8+etQOddTseBUfqoP4nqGWAz5h9suSMUJlEqCUtMph/fSzgqQt2iA//Vq84ScnvahSTSs0HhO45fHU7cNGtya9g2ypF48JXVv2lBi9AMOE+0Dk/kth9frnXDp/80PT4bvH3ilj03sZ+PcoTYkDBt3TGIzYcRn7+SFfqA+UQDXe2wGksJ0ArqchdPxhW26iDcscamwbW0b1hcEKY0+9wTlKsF3lSGfmUb6Z66cEyvZih2CJTq7lbhTg96wLX8hQq6mjIFrTSgWWDjxiH7TRlHAFQ660POvI87k3oIAJHuqs06+Ln4mdJ5JXm2IA8CEDzsPIdWzcPL2jSLT1ECcOEDEUzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EkX3N/rQcm38pOPe5wmPCr5AjHjscZCezSZWQ16IgubHrug1Yu95MT/gHaFX?=
 =?us-ascii?Q?SKgvjRR93QxZOmAyH7H53I43sZcWmXCvZhSjhtEAGWXfhxbeiIg9ne9KjFCK?=
 =?us-ascii?Q?s7TramxZU9/rXf9VLnArnFlvoumNAE3Pa1y99hGcy4walSEdT+8TLPM5OC7W?=
 =?us-ascii?Q?kM8rprK2fh6tpeeP3c2fvYfEGk/tJp4LYjHnbUfjmJfStsvkhMGeIqspsZHX?=
 =?us-ascii?Q?UaUp5d+Aln9S+KQcfgSVYOvMan3Rz2LDWtmEcXLQpt1Xjp8KNKFYbmjW15uR?=
 =?us-ascii?Q?xCV3ahIM1cF9w3xeZJ/WwS8j2P2yiMFUtyPVCv4g+iIe90AaTxI9hyGmlKY+?=
 =?us-ascii?Q?7OIgBpAnlYNXRj6WguieiSj0EpBmq7wQimWB+Fi2AXstHiZorhjSo5UjXCIy?=
 =?us-ascii?Q?k7HFAf89jvzsNHyMKjN7/JN4cMLqEgk2EmnOgBz2MzwhkztJUzhnDM7zN9hs?=
 =?us-ascii?Q?tBMeipWB3pfv5YBj/hGK0hQwWnV4YpeYKpW26EZFp+A8uy9h5A5yUIuZxtrN?=
 =?us-ascii?Q?2gFnJWKY92XCFGcxNzRQ2+JYdEu60h8H/xUwwGWkYg1pwrJQfbsm3aWcMB4H?=
 =?us-ascii?Q?3kB2FJ5C2An4jW+Jxkg3KwvyUo1LWibAcq03RqK5KISVrrSqJbTIz7MBpVUN?=
 =?us-ascii?Q?p62hAMMNl8JsrHU9K37zFAMnbXVjiwZvo4r2Hk0IKqNnuV5HEmXKGy6p8g+r?=
 =?us-ascii?Q?WGsteTwJEx+SvwHlqdNXB9GYgzQ3FbNpVZRU3x1Efo9/sH1PugsjGJY2E4Hh?=
 =?us-ascii?Q?nmIdqBUDrOblQvuxbe4TkELbDtr4Px4AS5rvg+5mhKVYvRchnAbFuvmljzrh?=
 =?us-ascii?Q?N7ugBTuJUT6wpqBMho6nlKnYfgwozUauFdqyynI86Jl5GumZntroUo8A0nVE?=
 =?us-ascii?Q?yRjaDCg0agGvVzkce2uxEM7uw1LeMZm6hvwvnT2zTjj5MyZHUMc3uRq4Eaux?=
 =?us-ascii?Q?HIEcgxKNgw0apdPYJjkBzZOX8UcUseMvu48zCdprCvVUXgaBDX5bzfBLy3F0?=
 =?us-ascii?Q?oQglrQQBDGCn/8ntluMKCpIl8ONCaHK7D7/s2OVP5Bc2fBb1L/jxYiDdMwub?=
 =?us-ascii?Q?6a6R4Wd0PFCmtVUJGD5Jgs9Bvz2SoZOCT7Fu1bp6ZyI5u4dYDNMZHKq5xri5?=
 =?us-ascii?Q?80OEVVKNND93RH/+0VMVrJKBmQTuU5TZJ1zjJm5jvjnKE5QppMrJKTnXseAU?=
 =?us-ascii?Q?4i/g18qaKFC7XV/zLTTVKROZVHQPj3+NeOPCd6RiD2z5Kdcgg7MEMKq7xwDM?=
 =?us-ascii?Q?Vx4LI45CB+Zn/WvQVBiMToVqek6Mh8qcO3OJsT18/C8RvmGRojf2lv3P+rV6?=
 =?us-ascii?Q?IuTFU+Qfq9R6tfiSiZX64G/u77OfEZHEHNo7uHsGmQGG/McpILTlOL9rA+4N?=
 =?us-ascii?Q?HyOOIyEQXilXvlmCWNSPysF4FjxI8B3u0IYy0jyVXjeRaB36MnyQbEKuGHh4?=
 =?us-ascii?Q?kRPjYBC3SE+kWIJ3YrJKmVSgsva3IxIwnaS7RT1TEfeY/pO+jbbkwAUq4LjP?=
 =?us-ascii?Q?U7eUAB5NGV6jy8I54UVEBU6ENxPuR1acaCUBFaHp5rBGWpgHnv3JaSPEnYuJ?=
 =?us-ascii?Q?TPeJoWeTvAU/TB/PVPq1QJMrwkmqqeAzoSMaoseesPPG/CBi8ML5UUunnKf/?=
 =?us-ascii?Q?lmi5/OsJWZp7KlONKEfOBeDxVwojAggb7XWRdNMTR63vhTuKRIP84i1M7LIf?=
 =?us-ascii?Q?cFX+t89oLhXzlBgL7AmpMd9eb6kDbgdrYC6PjTRBAepzSlOb0M3V0r0EYj6C?=
 =?us-ascii?Q?8vCv42OBgQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7316f934-4fb1-425e-f4c3-08de8a4d5042
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 09:02:59.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2xe6vw4ZNCNHP29Ayyf9NRdhmuXx3Se1j4JyW/C8XbuQBWuEZ5vpdZCW4sost/kPiab3Q0rfBxHEtRNZ8e8Do9MKgFwTyUJ6R8Paltea7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15433
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
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30207-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0F1B5321D2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RAA228942 and RAA228943 are Renesas digital dual-output
16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
driver configuration. At the PMBus hwmon interface level,
they are compatible with existing 2-rail non-TC controllers
and use renesas,raa228244 as fallback compatible

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 93 ++++++++++---------
 1 file changed, 50 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a0537..8216cdf75 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -16,49 +16,56 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - isil,isl68137
-      - renesas,isl68220
-      - renesas,isl68221
-      - renesas,isl68222
-      - renesas,isl68223
-      - renesas,isl68224
-      - renesas,isl68225
-      - renesas,isl68226
-      - renesas,isl68227
-      - renesas,isl68229
-      - renesas,isl68233
-      - renesas,isl68239
-      - renesas,isl69222
-      - renesas,isl69223
-      - renesas,isl69224
-      - renesas,isl69225
-      - renesas,isl69227
-      - renesas,isl69228
-      - renesas,isl69234
-      - renesas,isl69236
-      - renesas,isl69239
-      - renesas,isl69242
-      - renesas,isl69243
-      - renesas,isl69247
-      - renesas,isl69248
-      - renesas,isl69254
-      - renesas,isl69255
-      - renesas,isl69256
-      - renesas,isl69259
-      - isil,isl69260
-      - renesas,isl69268
-      - isil,isl69269
-      - renesas,isl69298
-      - renesas,raa228000
-      - renesas,raa228004
-      - renesas,raa228006
-      - renesas,raa228228
-      - renesas,raa228244
-      - renesas,raa228246
-      - renesas,raa229001
-      - renesas,raa229004
-      - renesas,raa229621
+    oneOf:
+      - enum:
+          - isil,isl68137
+          - renesas,isl68220
+          - renesas,isl68221
+          - renesas,isl68222
+          - renesas,isl68223
+          - renesas,isl68224
+          - renesas,isl68225
+          - renesas,isl68226
+          - renesas,isl68227
+          - renesas,isl68229
+          - renesas,isl68233
+          - renesas,isl68239
+          - renesas,isl69222
+          - renesas,isl69223
+          - renesas,isl69224
+          - renesas,isl69225
+          - renesas,isl69227
+          - renesas,isl69228
+          - renesas,isl69234
+          - renesas,isl69236
+          - renesas,isl69239
+          - renesas,isl69242
+          - renesas,isl69243
+          - renesas,isl69247
+          - renesas,isl69248
+          - renesas,isl69254
+          - renesas,isl69255
+          - renesas,isl69256
+          - renesas,isl69259
+          - isil,isl69260
+          - renesas,isl69268
+          - isil,isl69269
+          - renesas,isl69298
+          - renesas,raa228000
+          - renesas,raa228004
+          - renesas,raa228006
+          - renesas,raa228228
+          - renesas,raa228244
+          - renesas,raa228246
+          - renesas,raa229001
+          - renesas,raa229004
+          - renesas,raa229621
+
+      - items:
+          - enum:
+              - renesas,raa228942
+              - renesas,raa228943
+          - const: renesas,raa228244
 
   reg:
     maxItems: 1
-- 
2.34.1


