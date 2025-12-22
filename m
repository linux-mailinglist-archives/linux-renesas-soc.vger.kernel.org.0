Return-Path: <linux-renesas-soc+bounces-25993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A33CD639F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641363063F92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF2330C37A;
	Mon, 22 Dec 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VLO1gOLp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE7327C0D;
	Mon, 22 Dec 2025 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411105; cv=fail; b=mi1OLwsPl5zoPtURmxpGa/GBEpU+EK2ZKbYinS0zuKTIjs+oTGoWkN4mHB4cv95zqVXj17apVJXFH0wjF0RbkoZuj4gyEUB0uWrvBYBSNI4vMPucDm/ZHXqueAnQBsw7jXfqMF0b9AJVN592aAFuPQDBpQYGEkN4lGPMoIwdP7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411105; c=relaxed/simple;
	bh=IBCuriO/AnIguiVNLFYBxr2m2eflADpqPEUtbH545P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0aNeh3TI0ufmNlkp5aePF/fv0D8aKoxm62//7RYyaJlU8bnAdCCBrLhbmCcS1lD/SPXg2iDZQ1M+ZPW5xrCYsHcKuVar674D4NqY0BvQYmU7WAT6ZK2IzbXBDbCSyII7JJueyTxnxRM8s6d5rf7uZk4TR0y5ilulBbBR+MqyPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VLO1gOLp; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBPpJ2iNogYmEnZoSpUwZ0OynxvuxEEC3DERt8d9bVibhB8IllLm3B3rj+eaFq2M+0FdlBC4px3cqpZlnX+O2gmujXT/oA//1F0J/mLD2clLz9CbaxYeJX67RJDz9Z5+kKHqFC/mFTMOihSYo9Jfnsq+GMvNVYN9gv1AoCl7SuWgIomfVCVmOqTwaKFR4CgVIsmpJIrIHoaoffWGF2uiPk1Gstl9E08tmHqk3rQ8L5xdZ89d8+/QPClDVCQ0dBdiGB+WjxnVHLeelxexqvEiIiZLdn9fF70S2yVT0LuagVt3zyeelgTYsQ85kLYr2RuhEDwjRm+kGNQrWxejX8bxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFi6iV+sR3R+jCtXUk+b/mCQffDWUwYfYa5ebPsgNP8=;
 b=dYPIkMTCoLYCN+KMd38lXFbfTnjlvo/jGusg8LTHCesDYpiyiItJE6hgS96OCSzLQ7jArATWBwgHWKtNjVskikA/LEE7GbxZkm3dXjyp6Ie1HA9gZ+hfmvKZbaAyv8wxorkzi+N9i/RjM0XHFfyuIE6LoiptoL8dxi5KMdsAYHlEWf+wBIj7G4/rKClIBTuLGp9MXtfVS+bw2LcbyeXPrOrCv2bFO4+YU8zHa2fuiPgAmGrC4KaE3se1OjnhMtdW+crQQCe3Zuit5xxp9wHx/K/pbqaBsxGVqBZWfvZTIUOryAVzwBxkmbrghewar4Grb+2z/RayUjDWK/BhPXWFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFi6iV+sR3R+jCtXUk+b/mCQffDWUwYfYa5ebPsgNP8=;
 b=VLO1gOLpPlFmiKn/IHz7vaIhTbE/cyZ20bAV2d24lMzE8KGYrpuEJyJiQcHBpAMDxPUagL+kaa3xMUhre99oACsxjHiNeiHST/vtPWOy72T3tJ9uRet97YAiKnJy/8t2xPtJ9VnyZZ5xFX5WJqVPVAuaLGwwQkURX+L8IpCzl+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v6 05/14] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Mon, 22 Dec 2025 14:43:39 +0100
Message-ID: <56f0c815c1e019cbb72bc87b5a0eba7760aac397.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0ec515-a64c-4732-e942-08de41604cc8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VOap5eYom3tUvZlk2WAShS1An4mWYPHKxoYQgJVLCskfwP3cTKG9iQLFRU7y?=
 =?us-ascii?Q?xtPBRnxXG03LmQJjTqt4NuV28N5HkP4Y1EKshgDSz33RyLQSersRvvzqsq35?=
 =?us-ascii?Q?d8GwJlZndWO1fAQIuQGjqE6ibx0HkeKje8PyqZ34uqNnoSVgpPgUU0vGWaow?=
 =?us-ascii?Q?bfoAOvVZhYlaj1Qy3aQRRR1ULMJL4SLUuHglvPm47TKFh+9xmZidka+hNKPe?=
 =?us-ascii?Q?yKYmYcZgPl/Mmr9ZpuiSwc+T55zCcwyl8GGlneXU9DuFxi9pQ7VwgjcvVlyN?=
 =?us-ascii?Q?tTXBIXukheWqSR2JeBV/XcmPQ/UnzwWjfwAz10OCqacpvpD5lGpCqluz4B0O?=
 =?us-ascii?Q?YFc2UyGt2dBmYcOW7R6fzkmhmU1J6KCJ8GbhajB5OAJYnYh3hG8MV+JUeyKV?=
 =?us-ascii?Q?Flf8rQIGmDomgc7Hrr7/7CbtMlxlvpk8BM48fLult4e/dWrD7w9Pu7Tq3D90?=
 =?us-ascii?Q?/jU/teJpDNh5sKIERdYnZ3/OwpUW3WCxIUoKEpgJ6be1nckFmH2mGuJmROdi?=
 =?us-ascii?Q?E22MNMIHGEWDsIxU4CcgQauXRx3IOnZ1vZMVQ6vvIDwSjTeErvjJzVBw9M/1?=
 =?us-ascii?Q?3DHa3dy/F8FM9x/+7UevHzEu5FA3TvIlJRCwwF1rRg7fYXWkjabBVJ2DPBUp?=
 =?us-ascii?Q?m1fKQ9z2DSGN4mzuE9RsZFyvGayEEpvhpHneZOC7OK0BHGexAO8qEIfsu52Y?=
 =?us-ascii?Q?VjwcmJw13/ZJs0ysjwfFpBG72eeP8A58YbRYKGgAcGkuscHh5ZQMhZWJOcTO?=
 =?us-ascii?Q?thww74NhqPlEnCWS+FWZuRWoYFRhtbJZ6ElV79wVYYucgblcZE6LPjyV1J2F?=
 =?us-ascii?Q?RP2OMMcGiPkGyMUlcoafCBJFKYiirn2xRwiopy4KjHlqXNoX0imqkEsAvnb2?=
 =?us-ascii?Q?oaFJNq0ulBQxt5AJWx0P+H8EdSyJu8G2PC/ePVssLDTCUbmbY5lokTOvCG/I?=
 =?us-ascii?Q?aI0q0EXIiIAM1twyBdE6LHoCm/ZgQAi2Yu7++kivuTM6hrcSKbxnYSYKvp6y?=
 =?us-ascii?Q?McV0f/7Wd/Uvp3r3U+EQ0G4Qw67LjAnTn7/kn+eQht9lTPYonRMzGo0eJQy3?=
 =?us-ascii?Q?PW/MctRwEOgPS7m4F7t4OAR8fYK7oTFo7LZyxnQZFBLSpTY7IxMzi5H5VXqq?=
 =?us-ascii?Q?bV81zPOZLw5Wx5Voy5/Bl24hAueRN8ZZq4NjInsMLzt+CPw0kSzLXfqPwOpn?=
 =?us-ascii?Q?PT8XYAZmLISVaxn9rmadRScgKfszgepCeDMZhQhXK5SlkhJ+BkxHwxrEbecM?=
 =?us-ascii?Q?gdPgTdCRLOZRzIWz9xeXvY7HtZylL2ceaidJVh610y6dTKvYT+OWutCT/gv4?=
 =?us-ascii?Q?VYvwPy4mGcne71zTE7iXm/HhMIOm7kiVs+StQC9VURuOm5NWOGGQyXOFADo7?=
 =?us-ascii?Q?dlWKrIGYiS7IvURmdAuAWndMNutogNfAQz3Jy2KqlNCEt4o5l4X4nks/PBu3?=
 =?us-ascii?Q?iPobAokdRd5tYOErVshAiQy+qtCFkFXAXlbEIfpW/jVFCYemPo0i9E60v+s9?=
 =?us-ascii?Q?g4mrDuLVZcJjl5vV4gXGu+yZWC0+Py+HwqYA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aZ8PdxjBpGzgQlR6XIu/8CKK2kHkJzjm48wkJg6Tuqz01B2IrOWdkaKObv34?=
 =?us-ascii?Q?wN2AjOi8lM+iPX7rru0FshUZOfO5jKQjF6cIZxd7axMUzXRBJykpMCCPjOkq?=
 =?us-ascii?Q?Ajfbz4G9C8htQ91Cp1M/3efMLQVIHU0/rNI+x2zZoJoYwdz7LxoPIMKd8ZDh?=
 =?us-ascii?Q?LaXLWhDGdmJQxOO2RlJDKgr6hdU1fDyXqjA2NdPKa4IUXoCL7Bi2FfCgMi80?=
 =?us-ascii?Q?DJ4fblfd/tsxvRGqrNTU/TgDDMgp993hN+hrFD0kBAswH8hhmmtsDlZYVrZs?=
 =?us-ascii?Q?msD6jRPgIKG5ztmH0fQtteRKHAWVnB6D6kZ5vfwkEDS+PaRZhJLRo/RhiH7p?=
 =?us-ascii?Q?NH6EjMvw1iK/yy7WRKT0fZrWFH9QpN6aAMQ9ob/lJFcGMyNXNcWsaNpJJFy+?=
 =?us-ascii?Q?+45NJCyg2WQK568py3RCs2D11j77TM436bWJVvFC+YGOOhIOdbkPJuMBAu8R?=
 =?us-ascii?Q?szK0CjDG3ZlzUkYNDtZSy81gmGAdeyI5FGhis3P1pq6ozNhT/Qr2HPhtc4fv?=
 =?us-ascii?Q?HVGI/UUNhlVIaGs5jfl0JM+M9Q6c6S5oRleoGX9DlLs1CMYLRkY0I9PBW+Zj?=
 =?us-ascii?Q?XS5lXQMSvzfAJjUGHwu4PKHLzeVUVRWtytaibKMyL4xERO+fLrffXoMpG9TS?=
 =?us-ascii?Q?yO6aUh2HHlG8VDNrRuAIaWNd2dbv17g0TXz75/douz2S6N0dOyqyqgQuSkXq?=
 =?us-ascii?Q?1z+4DpUMz5WEkFamQTM4TwCprelMCAzzX9c2/vhvAxHh6rNJSrXFmMcc7lHg?=
 =?us-ascii?Q?RoOz0Gm/8Kab4F4sOsFsSUMMeJ+QgLBUvyGuSjh5MkU6AwNmlSXwsLuB5X2W?=
 =?us-ascii?Q?jnNTycmbDb1hhBXRD6LA/Y19vSof5t/zt70qdqaaCIpEbUPBWUv2f/5b9DVL?=
 =?us-ascii?Q?WI1rOtywiVvSBBxn4AXa89CJEHdfPgpuM7Lw5nFEVlRNpPnJ7rw8OFkASHee?=
 =?us-ascii?Q?tUROqdkv76ICHOm6sOBFDpWkBAwMmPC2LxfKMOCNZZpWXcFQzVWq3qvW/h6N?=
 =?us-ascii?Q?Pwj76emZGkOBM9Ka0a1OmBlfaauE4/xF9M/nqdO88FXSk7DW3Mzs+RqwL9PX?=
 =?us-ascii?Q?fYB9wk2L5xbssc6NA9p0hQS0WGiBeL1YSp79XxDtho/F3CvV3D51vIaFokjQ?=
 =?us-ascii?Q?qyEnrFsk9oEGq5/C0rEbTwWPlQ+huz2+fLiBChA61JAKYOqOIA7l6KibN/9J?=
 =?us-ascii?Q?jSTw/K95kNO0+8XlZxlExcKobUN8f/TiljfjFj7PFEo2Jv5Mz6KXY9SLtTkr?=
 =?us-ascii?Q?hQVhE0Rz4b6TEPRnkt7seG21kyhvUy2Qei6mhKtyO0ghlj/qDlbjFu0nK6la?=
 =?us-ascii?Q?Hd43LBvlDG0V/8VmXfQEP7LC176XxCcsPvgNL7dacqiAaJVaK46iVEA3SaQy?=
 =?us-ascii?Q?6HMm35ZguuLd28+kuFg44SSS5rsC0pcrBumS3Q+oeGk2dytaPiZsYBcquYK1?=
 =?us-ascii?Q?wqZqMJGj0G0hAdRDkiP7RuPXmBZynbstjBwo4x+XIwW/l4LvXUBru/Hk2Cz+?=
 =?us-ascii?Q?Yiqmzs5wUvJFpM3ueJgKPMG22eG+CaASn0FlQ/6obpw+lc4J/947B4MdqNks?=
 =?us-ascii?Q?jMbm7hqcgzAbjQROUjsMWdu3VEjlRyXcpnkZcvEun3KNCo74eS4YwXlpNnho?=
 =?us-ascii?Q?gRy21sCxMwqHc3/iz0NhU9x5zX2wjYGm1oufKFypAea/dsTEEv+JoPDpWMUz?=
 =?us-ascii?Q?iD+Si8BAZXkG6OaSI9vzHg4U5vCulHLZRtvNEAtShA0q53I8PdrxZHf9HFGe?=
 =?us-ascii?Q?hNZEiDVVuy+AC57HcaD8n15MhY+G540ZJV25JvOzq0rQtm/yTkTj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0ec515-a64c-4732-e942-08de41604cc8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:59.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnqlvQqtzoSxA56lvXCHEzpQwGMqPAJWd+0s8F6agaqFYfPQJsMrmV9gm323iaXSVH+UWzQcN4ojERv3zKtgbl2qkn29DRQ4+eFpcmIRrLrIUAdgEOGVGYDPKrG850gU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0


