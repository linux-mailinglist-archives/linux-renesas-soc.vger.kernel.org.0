Return-Path: <linux-renesas-soc+bounces-8750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E196E9D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88401C230C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC613C908;
	Fri,  6 Sep 2024 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="fwmfqzsl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010064.outbound.protection.outlook.com [52.101.128.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7D17BBE;
	Fri,  6 Sep 2024 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603297; cv=fail; b=YciRJrlIVlx9MD8+xe8UWI/1hy2jgA2HPu18rLmnKS96dIcOmIm+ntooRR33fG06CPmJx92nm/WIDFqFWC6H0xY47uYRkYyoiyo1qNPoX/rz+C6ue66zzKCCQiuCcVO8Pm1qCiT+n7/M4BDyqMI0KpqW789Ckq0PKzwDPM2fZac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603297; c=relaxed/simple;
	bh=s8gt+Wd8Y2tjSFF3oAuJL4z7oyOFNEy+yaFNbuUzeC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MhrpxM5KVkg310aiDhIjhCS1X7ud7s20Sdgx403i6q0ekg+uVkP4wLKXFl2FRrWmk5RYNShbj5QTsBrbuMDzdTTNvuzVro4cASIu2nxkV/oGoQm1tgtEC4RUTA5fD0BtdjeXRZTtyrvvALb3RSgEtN203o1cDG3AWZcvN46gOZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=fwmfqzsl; arc=fail smtp.client-ip=52.101.128.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSyv8nJK0X0GFRF0VToSH6r+e1LfU8tOxHWSd1MABm5A27E8dndv17+rKybllSCWOcObNtWz7Q+e40gpK3a8UbnHYIHkE1mQLOwJBVaYxIXnb5ANYz0UmbaIsRI6VtIaUq47DGaxGU5qaToDvvvvLrWr8W4sweQ3V44sJVOCKrFaGfHmsqvRcWvJB9qXNM9hKFIwYT+qlcZNzM6BiNXBXwmOWMt6EY9qMyanxxZUzPRELdq3VcVMwPlTv6p8Z4WTuoYdntoofRBff5vWXz7ZjKYQ6EMkD0xfK2DTkE9r/1kt6GSW1+JrEuvC9qJTWt+abqC/2EkiUo8wScQ11UDiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8mBh52ePo0aBwypvOcm0NjdEbgAMwnjQY420EsYpmc=;
 b=fSg3ociafHDyJ96i80Z8ShGmC+ZS969nhO7/0SpwG8fpGaM/iKZJ1O5VV/KN5w0Bhkg/fsHOtxjo1QTDNxawfDQrxeK0KMN73zt8BGR3e1L21/bT0ZsKhJAsp3g4kIfjCuWNYaf+IqgK7YaNuPVS/Vw+R6pbfBJZr06BFhOLe2a/m7/KDU6N04JcE7WgZ2knZo5sJS4P77wUHwsm3/ZDxAXZHvIGdvAEGPOA66h48MZLPh9Bh06l+mYvbIv0Ygg4nu885jN8QvTWfCBJ3L6Z3FU0qbhH9bIrtkK0zJDvOOsCoIflxRT4i7fZGT0tU3g18lZupkTyopopSWqNIQiX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8mBh52ePo0aBwypvOcm0NjdEbgAMwnjQY420EsYpmc=;
 b=fwmfqzslu2tuBpQUo9rgF8cv+CKIBHclOBuySXoZTQu0j3sPFgtMm8/wQX394i6gtrsZoa76YjubqYt3861i82oU8kae1AvKABvpQ7B/3erUo+ZF/4/y2ftvr98Ql6bDAyZFVQ34NnkCDKUAT6erxhbX2/Qtdf0446w3730A0kByFe6LjFyZ7x4iqClRfXvP182UcYtzGOGDsj04TFmMZbt2/+4cl0WxqJ0lsa5FlBSKidVihIl/TxGOg0OA6rUls73o7tkpF59NNrqbAZAhS2rDBCS1KEjsR4XcgBAjW1OYEoWkQp9Iv8A9kpcPp1nicKVbZhqIaHrnFBN56uLKSA==
Received: from PS2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::18) by SEYPR04MB7541.apcprd04.prod.outlook.com
 (2603:1096:101:1e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:14:44 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::cf) by PS2PR01CA0030.outlook.office365.com
 (2603:1096:300:58::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:14:43
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/3] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Fri,  6 Sep 2024 14:14:15 +0800
Message-Id: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|SEYPR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4f94db-7ef0-4780-5034-08dcce3b333c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFExV0h1OVl3QlJFeXFQK1FlNmJHbDRFNnozYnZBNi9hWmhxdTJXRi9lSmdv?=
 =?utf-8?B?dTU1c1dsZDR6S1JONFdWQm9iVFZmYWRXeGR5RXpUV2JmVWVidVpmTDUyeHJi?=
 =?utf-8?B?K01GL2FzWE45QnNISWluZXlkUTFteUFBOGYybUZLQXE2dHpQcTFwbmtlVDY3?=
 =?utf-8?B?QlVKTWhycC91YTE1eXZlcVZUM0JWK2l0WjBSQlBqdnEvTEx4UEpVSDUvMFVi?=
 =?utf-8?B?bm1rNk5zTkduMEg3ckk3N2t0OEdSd3VZU0pPRXNpb21BTktaYXVIZGhFWlNh?=
 =?utf-8?B?VThoNUtWQ0xHcDRyOVlETE85a0dOZHlYbmIzbWlMdDdoa3kyMDBlQWV0SnJM?=
 =?utf-8?B?OTJiemsxUVo3a2dDOFBvUTJpb0hTQ1BnaDJJMUFMeGEzRmgvMnZhSHNRSFpk?=
 =?utf-8?B?VHZLMk1CbUhsb25pYVpCaGM0Q1pWd1FUc2Fla1ptcExsQlVtMTJjZWNpSmlS?=
 =?utf-8?B?Q29XcVlyODBsajliQlhIaVVoQy9mK010d2hvdjFaQXlSc2IyZS82ZHRFcnJH?=
 =?utf-8?B?TnV5bS9SMXdtU3ZDdjBXT3R2MDlZek5QNWpjZERNc0NYMGt6NkNWOWlDRjdj?=
 =?utf-8?B?UCtFcE1qZklsRkc4WWdGbVg2WU15OG8zaU92a3B0WUJtcjZQTjFlU3BOL1Bu?=
 =?utf-8?B?b1VnVWtqYTZYRitlWmNLdjdDSnBDUm44aTVURWNUSlFlZGhyOElIdGtpclh4?=
 =?utf-8?B?V29lWUtKenNlKzNPUUhIUFdJVVhKbUFqNE56MS83VmlMUkVWWExiVlZoT2VM?=
 =?utf-8?B?OFMyS3dQVUkxOURzMVhQVmM2TzBacmg3MTBQaVVrMTBwK1p5eTJ2ZkpnQlpq?=
 =?utf-8?B?VFBQVWJoS1VHL0FIY0F0UC9wTTFsbGcyK0U3cXFQMjVWSHhTQTBZSmRZQ0tC?=
 =?utf-8?B?WXNzbkgyd0JySXdqcS81V0RZcGV3a0tLVngxTC84RG9abFExeUhiUWRBMmZV?=
 =?utf-8?B?SVpQQlo5aWN5d3NMckZYM2lvcDZ2OUZsLzc4RGdtUHlmc08vY2U5Q0Vmb282?=
 =?utf-8?B?bjF1M21ndEFEano2SjNwT2xCTkQvellvVFpVaFBOT1FvWjhxS0dRK0FPajVw?=
 =?utf-8?B?MldRbUNpWmhnODBYOXp6cVJCUkp0a1krUEdRaHpWSlR3WnNIbUxab2U1NXRC?=
 =?utf-8?B?c3ZrMGUzeTdJVWg1RGZLYXVoNG1aOGdsSm5iZUlNMDArV0ZZSmVQZWxKMUlz?=
 =?utf-8?B?dzZJMEtNS1QwQWJxbVBDVVJzeFFBanNvQzdYazVGS1h3TTNjcnA1TDlzRGo0?=
 =?utf-8?B?ekd5ZXBKSzQ5UFJtZjFKb2ZoOGpGcDJOK2VTakg0TzBlQS9ZdzQ1SWtRQ0RG?=
 =?utf-8?B?WVpDVElLdHU4RC9CV2g2bmxPN0ZiY3YySDZCUnFKYzIvb3VGQXlBeGFQQjJv?=
 =?utf-8?B?b2g5dVY3enhDb1NKQm5jbTM3MWJNK1dHa0ltUDYxSjdocW5nM0ZpUnlPemxv?=
 =?utf-8?B?dThHckNtQnFHZzlrYzhxazhaOVozRG5EN01nMnFnSENhN0JoUEU4NWhUYzFs?=
 =?utf-8?B?VEdLV3lRa2FTMDczSUNqcDBrbHlYREJrLzVrSk4reE5Fd2s3dFltUXhnRHFQ?=
 =?utf-8?B?bGV6V2ZKbVdPcTVXcmE5K01qYnU3YUJiSm5PZ01DL29mWGNNako4b1FtTk9m?=
 =?utf-8?B?Q0xzZjAxQzFuUkdNVFpqTUl3T203SlJwNXpCNVZHM1lFaDIzam9Td29DRGVX?=
 =?utf-8?B?OW4rYWw3TnZKaVdoN2N0ZU5Qc1B4TjFwMHpQSFNlaExIN3pBTlo4cU5vU3d3?=
 =?utf-8?B?V25GZVZqTFgrWlBTeDMxcVU2YnI1ZEg2eFJRRTFEbkFFNlpmTHlKWFVzeWVi?=
 =?utf-8?B?QTgvQ2FUMHlUaUYrb3g3UHdkbnI1VlM2VXJ3Z2FyNFp5bFVLampPV1cva3BL?=
 =?utf-8?B?dXRwekhpVjZlT1FXd3l2eHE3SUFnaW5DM0lWRStJc3NvY1R0TXY3OGpCbzBl?=
 =?utf-8?Q?qyd+n7CY1wiMTACoSgq7LX4KmZmWA9Ri?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:14:43.4782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4f94db-7ef0-4780-5034-08dcce3b333c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7541

Driver for Renesas ISL28022 power monitor chip.
Found e.g. on Ubiquiti Edgerouter ER-6P

v6: shunt voltage in mV and revise code
v5: review comments incorporated
v4: property compatible fixed
v3: changelog added
v2: properties reworked
v2: calculations fixed
v2: shunt voltage input moved to debugfs
v2: documentation and devicetree schema reworked
v1: created

Carsten Spieß (2):
  hwmon: (isl28022) new driver for ISL28022 power monitor
  dt-bindings: hwmon: add renesas,isl28022

Delphine CC Chiu (1):
  hwmon: (isl28022) support shunt voltage for ISL28022 power monitor

 .../bindings/hwmon/renesas,isl28022.yaml      |  64 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/isl28022.rst              |  63 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/isl28022.c                      | 510 ++++++++++++++++++
 7 files changed, 658 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

-- 
2.25.1


