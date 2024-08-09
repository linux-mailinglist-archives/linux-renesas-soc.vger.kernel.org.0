Return-Path: <linux-renesas-soc+bounces-7788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDABD94CB3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 09:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF9C1C21EE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 07:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D55155301;
	Fri,  9 Aug 2024 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="L+4lsT+T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBB1B964
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Aug 2024 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723188276; cv=fail; b=SJ6renB+mvJOJdOCS7ywUmsxX5My0Yos6on5dgBYv08O0j5KuN7zRDqA8FfVtnufXdZDzhrLPSc3i2ZKVt/IOemFdhaVP9cOziBPeRT0WlJhxsMBQbipfbhUHaVvgylsWwdP3MEm+5HuLcKiuGOz0Y5K2QStzck8OlQv64rJSeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723188276; c=relaxed/simple;
	bh=Xg+L9pz6Atq9ZzLa3Fi1ndLXbu8hbEr0zERI4swCU+o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=LpgIotkcaTiP/9X/42UWDfegohVPmBA9WPfH77pnHAGHCx1RwOJC4cYZ9ek6pbYPFpEyUJIpjd+u5jwBRGwPoD6xrbV13Nt7GvazXs5j0B5ormNpMU3Q+oPTYyd/ZrpSPNVmOQNJCMLMBCHE2hfIkxBN4bYg84OU8IBMF7dCZWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=L+4lsT+T; arc=fail smtp.client-ip=40.107.20.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH6rCXvS9+qw1s7oSUj4euVHSfXagv6zJjeMDvxGReJxcNf//zPNzz0ORGY3XpqOEW0kXjOo+UeL/lV+DtaZ95NZvhHn3otoXlBtglDSOr7FnPgUPnUnvTMDzen0yJ9VZ4JLmneqDvD+7MXI+9yBMMfsyHYr583xFFksee6BFduaIzliojZjD+2VmCyg2kqlMQ7Knb61/1xhOnyBCrHqNm9wrGax5B2m3rcCGiutgwXJprg4xhfpEbELo0IkPRWM6QijYnZ1KYWi0VRzBV2g1E0aZgMab+HtBpfcZSCLRotC87pymK4gV3okpQMAkAw2y2lWmGg4lyOfEBn/TyQ8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR/Suth2A5gJUctEVgo81vMd64ykEPkEWe8nQIpBu0I=;
 b=bFm3f5OS+M1bSUIotZqm69bvB9U/WuPnRFqT8f10Phqnqj1nbAEohOCVEDBmjjSvG+eqhu95+BmgWAvlCvcoXDDtktoPh8jUT9YH50ubORsUeQUP14MehpFbB+Ps2UK+F15Ia1rLNFYswUNIIJY0y9DiGfxYI1OCGSt3m+e533jYF7ru6CeVw9pA7mdmF74Ga8Y8Ii9sMEE1ICJ1uvm7BPV6/FtOECKY7O7nKiND4I2HpeXHOada6Eyct2oZItZOa6tk6nlkWbRjqN2Hjq9nk4cIa+z5Cj6DwExrFKCvd04qmUm41ykvyco1B79jot2V/AENkpLIL0WE01PNIYYqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR/Suth2A5gJUctEVgo81vMd64ykEPkEWe8nQIpBu0I=;
 b=L+4lsT+TqlZh6qvgLfUK/cBAks8DYG8yI26y60IZkkbRGg4DWNuuYwzolhuncAEU/tjgU3gHDSzfRrzFPE/9fn5szVGZiSOs81vll1GokPXvFvJtr0JLM55Lt1pKRVz3hxs0kGa1lThrFo6CKmeWE5+epnTrDG4eW7MXM+zE/lofRb7p0TSSwgyHZu5zn9mW/1p9VzsVUcUMlUP1Um4zYQeHZyiRFQIj0Q3vlEkmv58P99kKRANYmc7gME1Vhfi5HaaV2qnoWpQhPtqI2oEIsqaBJPlmcSgEHS6+HvnmyDLPWr8Cpp3G6Q12giWzkxDqA+cyAEd2497qOn7Oayaz7g==
Received: from AM5PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::35) by DU0PR10MB5728.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:323::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 07:24:28 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:206:16:cafe::46) by AM5PR0101CA0022.outlook.office365.com
 (2603:10a6:206:16::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Fri, 9 Aug 2024 07:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 07:24:28 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 9 Aug
 2024 09:24:23 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 9 Aug
 2024 09:24:22 +0200
Message-ID: <651189ff-bb02-4c6f-94da-fa2eb4dc0e49@de.bosch.com>
Date: Fri, 9 Aug 2024 09:24:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: serial: sh-sci: rx overrun errors and hrtimer rx_timeout?
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A8:EE_|DU0PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 43504da7-33c5-4b7f-860d-08dcb8444db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1dqM2crOGNxeHdkWnNFMHZqanJ3dGhFR3FoaThINEVHNlBmQWpSSWpSbkdo?=
 =?utf-8?B?NFRCSGNvQTdhdWtZVlg3Nm1vQUpCemVJUDA3eWVQTnpobzdVTGQxaTRVUDRv?=
 =?utf-8?B?RVJKa3FSSGI0UVdac0hrbWx0VUh5UG1qcEw3eGxVdjZRdHZybThZL0VLZlVC?=
 =?utf-8?B?SUJyaVJRdG0vWjdXR2dXNWtzRG9LK1UrdGdWaWhKY2JGVEZhQmZiekJZM3Vl?=
 =?utf-8?B?cWpEMzBJd0Z1SE5iaU1yQTkvYm1kOExsV0NaT0k5akc1NWUrcVdNVFVjWi8x?=
 =?utf-8?B?OGNxZTZ6czhreStSSnFaZHZhZjI3bUVLS1BZMmZPeDlQWlhvdHhQb21uM0Jw?=
 =?utf-8?B?YTZyM01TTVJMbXBJNW56QTV3RGdJblVLbEhxbTJWREVhTGVCcEJRaEYzdlRM?=
 =?utf-8?B?UUVmYTN1b2dmcjVhdGtYcTZVeFpFcm1UeU1wOWFXb1dpSTViVC9oMWFQbXJD?=
 =?utf-8?B?b0duNFBISXMvQms1TlFlR2dRbjE0VGRXMHVJZWwyUklLeGxCMXlJN2dGTW5m?=
 =?utf-8?B?bmY5U1U3VTUySHNISjhGNUVtK2FManljRFY2ZW8xMC9TT3RRR25hby8rY1Fm?=
 =?utf-8?B?REtTQVV5RWt2K2dHa3VyQ0drdEJjcXJMWnh3Zkg0WEIrdEhHc1J0d3hzTjc4?=
 =?utf-8?B?Qm1lOHh5elNhWjViQXBBSHNmdUdhVys3cVJqR1pUVWxXQ2pzL2NyWnRrV3o3?=
 =?utf-8?B?eHVPTXFTWnZnejhxUjg4WE9yNzRtVmdVMXd0WTZVbmlaYnhXMWJiM2xLMDl2?=
 =?utf-8?B?OFc4Vm1nUXFsVzFSVVVNSk5XdSt1K3FFYzVKWDdMZ1FBaGJIOEwwcnB3YVha?=
 =?utf-8?B?N1YrZmVVdHgwRGlZWXB3Qk00aXl0dmZXUmJqbmxnNG5LSWZpd29jb0JOb1ZH?=
 =?utf-8?B?VkNTS0NWY1VyVjlLelFzZlQ0dStFK2VDdkl1UlpBZWhVWFBzZ3lDZ1gwTnhZ?=
 =?utf-8?B?TFM1Rnh0b0lRK3h6dzNEZXAxcEpVT3FZbjdPZHZmOFNEbllPR0NyYU5oTUs0?=
 =?utf-8?B?bFlDM2JuZHBJekdobXFwRDFoc3gwU3pibkVtQXc5Tm1CVVo3ajcyVGNqVWJK?=
 =?utf-8?B?MSs4U1N2SlRqeGZJQTVBanhQYW1mTDc1WHNGK0ppcnQ3RmVvd3J0S1ZkSDhY?=
 =?utf-8?B?bGtkT1VxdnBpZzNNWUdkMktYSzNxeWNRWnZoaU9Nd0JQWEl4OTZzU05ST0gx?=
 =?utf-8?B?ZU1PazRpR2ZXTUwrL1k5S0crdGJtRlJKN1FZdnFnTyt1VTY4L3k1dmEyN2tP?=
 =?utf-8?B?UytzNWZFWEthMk5vcFc0UjRJZVUra2o1MGlrN2F3cFpPb1ljTzBkTWZ1V1FT?=
 =?utf-8?B?djUyQXRyQ0F4WDZPNjc0ck1qQU1tWEwyMzBDVVBuKzNKazBjV2RBTzcrYU1v?=
 =?utf-8?B?Z3N3dmZWeXBBaGxXU3BDMTRld3g2N0xCbWxOY2dpTnFrZy9nM0k0dWVSekVz?=
 =?utf-8?B?cGN4MkxOSTdoLzd2OGZtTlZxNnlxZ0gwNERYdXdiM0tISUxqTGJQbnh3RGZB?=
 =?utf-8?B?ZExkTDRHMUI1bkxqQlRacnZYeVQ0YUpjUy8rQ2xkekMraERNQ2J3cDZtOW1Y?=
 =?utf-8?B?WnJ3NDlQT1ZqWmpMRTZ1OEFkTXVXTzMxSWczRU9SUWhveUpDK1pPeVovZVVk?=
 =?utf-8?B?YmhDTDVpZ1A1SVhiK1VVN1ltZ0krcVRBdE8zYnpDMStWREhORHlJTWlZRFFw?=
 =?utf-8?B?RGNSb0lNRFZwUEw1ZUtBZkFmRHJYQjFid2ZCV3BsYUd0TmIzK3lvenA5THNE?=
 =?utf-8?B?NU84dytOTnd2bWlHRTJ5bzRDYXdzL0V5Y0lsWit0RDFZeG9wa29UZ05PUkNv?=
 =?utf-8?B?SkM1MFNrVkhsUlVRc0l1U21KMWhZc2ZIcWtDWTZVTVArVzBLUUVUQUwxb3hL?=
 =?utf-8?B?bUhIVDdEczRFZlNhaFVUYmppQ2JvZFlMRzF1eHY3TlRtMlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 07:24:28.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43504da7-33c5-4b7f-860d-08dcb8444db5
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5728

Hi,

short: What is the sh-sci rx DMA hrtimer configured to rx_timeout good for?

Long story:

Using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite 
similar to [1] we got reports about data loss on rx large files (test 
case rx 1GB file):

$ cat /proc/tty/driver/sci
serinfo:1.0 driver revision:
0: uart:scif mmio:0xE6E88000 irq:88 tx:40991 rx:16 RTS|CTS|DTR|DSR|CD
1: uart:hscif mmio:0xE66B0000 irq:45 tx:908 rx:1410 RTS|CTS|DTR|DSR|CD
2: uart:scif mmio:0xE6C40000 irq:89 tx:0 rx:0 CTS|DSR|CD
3: uart:scif mmio:0xE6E68000 irq:87 tx:0 rx:0 CTS|DSR|CD
4: uart:scif mmio:0xE6E60000 irq:86 tx:3506 rx:179863 oe:141 
RTS|CTS|DTR|DSR|CD

See the oe (overrun error?) at uart #4.

For testing the hrtimer rx_timeout was changed (for example to 1000 by 
adding a sysfs interface for it) and with that the oe are reduced 
(again, uart #4):

$ echo 1000 > /sys/class/tty/ttySC4/device/rx_timeout
$ cat /proc/tty/driver/sci
serinfo:1.0 driver revision:
0: uart:scif mmio:0xE6E88000 irq:88 tx:41621 rx:3 RTS|CTS|DTR|DSR|CD
1: uart:hscif mmio:0xE66B0000 irq:45 tx:908 rx:1395 RTS|CTS|DTR|DSR|CD
2: uart:scif mmio:0xE6C40000 irq:89 tx:0 rx:0 CTS|DSR|CD
3: uart:scif mmio:0xE6E68000 irq:87 tx:0 rx:0 CTS|DSR|CD
4: uart:scif mmio:0xE6E60000 irq:86 tx:514 rx:688401 oe:3 RTS|CTS|DTR|DSR|CD

I'm slightly unclear, but general high system load might be involved in 
these tests.

Now, looking at the code, I'm slightly unclear what this hrtimer and its 
timeout is used for in relation to the rx DMA? It seems it controls if 
the DMA is finished after the rx_timeout and if not it setup a new DMA? 
How might changing the timeout influence the overrun errors?

Best regards

Dirk

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/sh-sci.c

