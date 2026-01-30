Return-Path: <linux-renesas-soc+bounces-27696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDndEoHqfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:29:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E84BD26A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6ACA30B1327
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A6E35CBA5;
	Fri, 30 Jan 2026 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jp7oMRZv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CE35CBB9;
	Fri, 30 Jan 2026 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794005; cv=fail; b=d10SAyMyNoXSh11Q7W2FxNhrHvaGFzL0qdpEW6ZMn3+Kls+X3HFaZVt39ePOm6W0mmInf/XB1J/XOKhddCXH/8PLKRpFICV881GZNLLA0XIzLR0/0MJ+4GF9DfKtcwroOfh3MN+EjfUgap9gTW1e8wQi4hbM9mO8j4xA+/d4Fys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794005; c=relaxed/simple;
	bh=Unr9+rwNZ4fC2KlqT3Vt13y6dg2RLEl0tDZNa66MINk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQYyh0zfMt1lei64SW8vIFF99Ld1aHRn5Z/NlvLqtWXBkt/o4O2apCVRtPKxhEGaG7h5c7N8GOJU+J90qPi6FVy14TVG2flFcRbximHZU02GXw/YXLE/4U11zsOZzar9jRRoecyE7YA7AnBxTeZ6pyLxZ0QUWQwrWVyfkTDMhq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jp7oMRZv; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8RMod3oVa4CLdMsFqhSqGdUOeV/hmTYAvjxP1kLwnf8k2USguWDpjiGMYJ07T5yfa5t3NHoEHiFNM8wDiQS8PhrrdOLPUkxTRQgaxzk8GPrUeAJHLxAmMJ8WWQrPVR6lU0dx99UxhR1WAFum3XNpujQIb01muo3XxZWlv3ifaVt5D/3TzhYOjDlyujbSTI+8E5FDYrYjUXwlZ1K69RSigr8IZn2o2QQcfkmPYElN9fGLrVq3Gx/pwmc8EcTvh9liyY/fKOVgO4znD2bmWJtfyzJGX9m1DNHAr2CmTNc8FxITDGGx3BYvM8XYZID++/K59f2tjdIM37f/knCPpmdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egEVBRs+yx+Gy7+V3Bfn9UvkRnC6r2hDIQkXN+ITtrU=;
 b=ltqzM8073pyQ6cbhFSEd4dSrxwmWosJ5DU7s3eJ00QZ2Pq545t+Shutjv+IZNldXIqU+g/dIVlYYwb3WG/4Ro5MaHwSyonlKygeOFGxcKYQYABk1MG5DEdZ01kfFfhelxj1ZCcyFJxjqjyJri+ZIM4ZC6jVkhfh33qxUrkK+w3h2Kp8+CmfrM6xrCkrVFRuXzKfv4grGwd7OzFwl45IGrtUBrZ1J6NM3XUqNdeR4xvWn6US6DWNChjj+0VRvXfpUkNX4PsGmOBmA5996+bB2KnlgPksp0NcwtC5wv9+gB2QfCuKtBPINrDVnp6Vzxdyyc4qNpjVGseo462Vw4ZaY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egEVBRs+yx+Gy7+V3Bfn9UvkRnC6r2hDIQkXN+ITtrU=;
 b=jp7oMRZvIOpztEoYfZDCAMyXXocxhSvp4HL2anZStKfm5CvHGv6iF4vs0RLxi7RBJj6dmj9yW62uc95r9XsKiepDI1TRA1e6rG17dw/yZvLgLFxVbtVILeaxuikwfTbep41NJZGGy4DX4efU1a/Y4X0DjuTdTmzp+eOr2xoLhmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:40 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 05/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
Date: Fri, 30 Jan 2026 18:25:02 +0100
Message-ID: <b2dd2a7c8c57410d8ec904d8a0e82a27680c7d88.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 702e6385-b281-42aa-bc27-08de6024bb07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/21Acw7d42aCyr3ido/UDYmLC+EBUlCp385seJspr/Ty34YE60FEQ5J4RVYp?=
 =?us-ascii?Q?sbQOQ1g1McvDC0cGiyfWoP2vi7Q8KwnN/z4Fco7LJ8MIV3ff7mmB+icrbZge?=
 =?us-ascii?Q?Eb9/OyutGpUTPsAKY67uIBnAse93FrOBs0SnIUMu8PJ51MKoewTHvYqQtaby?=
 =?us-ascii?Q?O/g/rxS5sBaBu2B+0g/YKVOHWlc9rGStLteo749leJuoFhWv8h9lG81uQVXw?=
 =?us-ascii?Q?lIqaRADdbQOFsOtiUpQuFjHQQM65NXQ8imkFjS7IWQJihPmb9l+UBPzCbi99?=
 =?us-ascii?Q?MZyVvNy3n6U6iPGoxfQ73WrVFAq4i0+0u2xjrJBZx4DRZxVGtPD6+24at0qu?=
 =?us-ascii?Q?y1ZRPhbRVcGfKyW/YPN9Y281vCHLRYhefo7n1EMgC4fdA3hqDfOtVuCURMol?=
 =?us-ascii?Q?VDHxjN7qGDVvIaXQMFpmzD3HN6IO2iqzSJc156NR9JCCOT/ZAh1YzCCE7jt/?=
 =?us-ascii?Q?D62rFvlQ5XnESStT0ZjJY5zcRou6EaABEdiNmjgjFey+vEYrLSlTgtPfZokj?=
 =?us-ascii?Q?IFGWTbRkBkNhvK2D+0RUHxnMP5ilPLTe5vRVhd8BB5RaEpGcljWiDAl+RdZW?=
 =?us-ascii?Q?2QqMRJbt81jqqocAkKO6UkqRE8RKVl/GPGT3sg3A2nHMUnZumP4lG8SwJwjp?=
 =?us-ascii?Q?57GmDkO7GZgbGNLjYpsz4OfjSA69GIID22bm3wFDK+4JVUrTTwG1S2IJJ7zu?=
 =?us-ascii?Q?QnOC69TJHQbeyRavdJt/qbnD4yrDrP6pj4zbLN1OfOaaTA7zzRd/As9wp0Dq?=
 =?us-ascii?Q?x/FrhCX0rzTD1cSCkXTEYIwh2OcKDWc6DQ/fp9sb0fOdAWlGh7LzNyQhuF8Z?=
 =?us-ascii?Q?/53Et/UrJcHOoRMVGVentLyHq/fOMZuEJFDsj/ZhMz4WftKMGXAml+wnDpGD?=
 =?us-ascii?Q?M+7klDPrvy431GPCqkyBkcyUi3MX2T48E9Fhu46a6kHwoVe01fh85G8n30cY?=
 =?us-ascii?Q?/uTKR9/f4sY++vLlJ10Yo37qF0v6I9kOUZAesqOqzJF8smb7DCCthVP3JD2o?=
 =?us-ascii?Q?JLMIzTe7oaTNfiCUfwsmTnYv0ejRqMIzgJ9pVldOVGmm0YV7U1uztm7dh5cg?=
 =?us-ascii?Q?1G1VJv+98T6LNLfl1MryzWo8jkKAbjNBO3dIsNNlYbgIm5RwMp5bk/iGiu7J?=
 =?us-ascii?Q?I4Q4nDeFY7Xmn93YAqx5tVVVE3zDA7EaYeiv3ncWr/Lvl8ZXufn1gQaW1ogo?=
 =?us-ascii?Q?T0l1tlqrca3SwA0mJVQwuQ51Nk46VH6+LESfKqooVXYR4dcMiBtCvU03klvw?=
 =?us-ascii?Q?sVkzn/H1tuj4za2FEfF6ngEcg2S36HWbCwwORkSwoI2+4t2tdXovRT4yMrKT?=
 =?us-ascii?Q?xqh63wf8cqULAcjB6V2zpIj7OcRum4ByccIFJnn2uSY/cWDaDrccagBYqEaT?=
 =?us-ascii?Q?3WjaTHPXw6bFCz8e+AIncjJjDOqcOMdPy8wHcGcEWNv9rkVeyZHH9J16m6c8?=
 =?us-ascii?Q?l3ojmpYGN/ioT+Ni6phXBAwt2/9XcbC3E9eIpJ2XPJ5JauvGpXPc/zq1OXAe?=
 =?us-ascii?Q?Gx7ijhcCq+QRkpR48drGKsRj0oERNpZQ4/oWkiDGa5QWQM6E3oSmuKeJc83F?=
 =?us-ascii?Q?KNWYfeud8O7kPKlBbKtHtrEUoYiyKkL2u7CX9P1WAKn0hZEcqQISabmcUTGA?=
 =?us-ascii?Q?s4HOOMH2BgXVh6j4dd0lrGw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?N4Dd0ENOaNwhojaLCpk2y6wxayb4m2c8ZV9n294M9s4CrTpqK+RyEkgvuclH?=
 =?us-ascii?Q?BRFs6SJWKQN4yI+iL47mGpwDQG0oZQUGbbcWop2+PLt9NJ2XiU440RscMnS5?=
 =?us-ascii?Q?6Yq16S7+hlyWtThH3/Un4zo+l4xR3BExPKZW1zxTHa5Wm58amk5aJ+8CojV9?=
 =?us-ascii?Q?ZgKL3zmCn5+AA7TkQklVV4QhP15C7MPQHmG/hny1DMmZJ/5+iOL7nSV3CmQB?=
 =?us-ascii?Q?riDXE0TETOR/rRZEwrsDpoiRq5aUJdQG/RmwVRXDw1DWFsULQEJqgqlP2wGM?=
 =?us-ascii?Q?k5e2B4GKpRFz6Jzi+n+Pc94s/O+oMRPMv4A0jkoz9+O1h6a3m0iUInwcb26b?=
 =?us-ascii?Q?1cpH59HsXPB02+wOu1FapZcslM2rR3YBuGAusrZRvGtk2GK+B5rboSwJEmVy?=
 =?us-ascii?Q?ZxE34XQjXi8dzvXXpmQN65Lq33aQEAgr6M9R5kK6vjdht0ncGMnhoEAive6L?=
 =?us-ascii?Q?qO0Baf7pAWmEvrqdkthDH8wezzwUSVYG1PCo3zLZfz8jowxWsnfMo35hKfe+?=
 =?us-ascii?Q?YVmLZgHBdG8qNynL1gZRRiq4z/v4vZzC3mWClg6JiWNFaIGFR4Lwx1rLsGz9?=
 =?us-ascii?Q?GNSiNUlHFCS9JGeFOXgJBpz9kuirRRux9Xx1uz/AYx3+zbWZMpCsiAIqi3WH?=
 =?us-ascii?Q?XM3suI+PgRA7rNJEL3/G/M/WZmrk4+ADtmEZYtNxJ8A4ahRnpjWQvJnts/Wo?=
 =?us-ascii?Q?0tdl7Wp8m8XsVdz7vbhN+CpaRLHAav2WwuwvVqw65+8nYttQqd/5blWuJtwR?=
 =?us-ascii?Q?126AvO68x4D8ZyGbwBnvTupwW36nfHvAgB6LYtx3iEQETGrFsWAUTDZ78hlF?=
 =?us-ascii?Q?7Fray8sNFLbtKDk3sEq7xaGv2fst6YQ1M3yjwa/l0PiPub4PF3sYfWWR/MOq?=
 =?us-ascii?Q?L/AllXCD7RSs1Tua7mCpSHjfPBNj9Ejl4UtoXncPLrL3/v2zHW9A1+x0yIGo?=
 =?us-ascii?Q?BDHXwZ53MMYBqMlxzFvbaRP9gKQHM271CeK3nmpTC8cykuDwAQJPucmXcyhE?=
 =?us-ascii?Q?dEQHB97ig6csv6y7dpjbtKXq2hvXGArRcOfBjxjTtODnmOLze9ecijyAiWjO?=
 =?us-ascii?Q?SSHknZHtTCsBbzJAmEj28zDSLlDE6caE4e8BEmnBBJiPiLxwtDWfBBrwbMxn?=
 =?us-ascii?Q?CZ6+R3rPUjkhac2bzFngR+SCKqZUxDyFJqnCjVkgTcTDKTMT3jLcVMCsue5w?=
 =?us-ascii?Q?zdsKDGrMReLAreVa2zW6aqkNQzCN+/kVf1qCggVkr/KDsBu/uGvpTB/spbAl?=
 =?us-ascii?Q?IvQayvS4GY1s/yfNp2IKTXs2SbR6RI4BLh+sE/2JMY5GsjvFZ+h9ao+CFxit?=
 =?us-ascii?Q?XCcygfToCWXzQRwWzrlMyoY83yakUB+DTR5brChp04txOZQSgaKOfyLKAPNX?=
 =?us-ascii?Q?4MEEjHb9vnx2hVwHQ5qE6PFcUnSktFIU3E5N78Rc1cbkE/obCgS7AKUbng8v?=
 =?us-ascii?Q?JkvKJxiEaSMUp3naFHlExzVJhkmdGL2XyS4bBs+RxLcrOf3B//i7yPwvNZFa?=
 =?us-ascii?Q?1gexQ65eZn5kaVNHXCsyLPu87YLLhogHwtHjyOlqGhbrIgfy0emFvrvWP8se?=
 =?us-ascii?Q?A2SiL37fyAflrXizcQAFB/kUj5+DXRU6WvJEviZjxenqRkIQ+kPEsZ4iqmyx?=
 =?us-ascii?Q?G25/aVEyI0/+dXcFr9QiNjgDbCrMTUH93KSdei7PPM/efzyOqN3SbvGMUXVf?=
 =?us-ascii?Q?VN44ojH6LJrt2+/810nEg8rtETs5b9AmIHfmRP+IV3hXq/A04bLHQYCwObsB?=
 =?us-ascii?Q?yv2dYx+w51YyGu3dIpAWhbVac5KJbCi71w9xrtnm2S1x+nRN2ARO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702e6385-b281-42aa-bc27-08de6024bb07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:40.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0n5rC8mJm+szd2ipAHOCb5MnJeuKMlKCOSsZhJKrrVuZN5M6ZaM6MAxDh4N/TXtzqUYETwoI9N58laLm7payVZvIGSOK90Vx8t2yJTQnxg8Imt/tdJPwK1IA2pV933M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27696-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: A3E84BD26A
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable DSI and RGB output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 0e707391283f..aa6528b72cef 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -71,6 +71,8 @@ enum clk_ids {
 	CLK_PLLETH_LPCLK,
 	CLK_PLLDSI0_DIV7,
 	CLK_PLLDSI1_DIV7,
+	CLK_PLLDSI0_CSDIV,
+	CLK_PLLDSI1_CSDIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -98,6 +100,18 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16_plldsi[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -198,6 +212,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_PLLDSI_DIV(".plldsi0_csdiv", CLK_PLLDSI0_CSDIV, CLK_PLLDSI0,
+		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
+	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
+		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 74a3824d605e..33bc3c27291c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,7 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0


