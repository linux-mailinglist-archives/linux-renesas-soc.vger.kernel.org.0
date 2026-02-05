Return-Path: <linux-renesas-soc+bounces-27953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC19NdarhGk14QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:40:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CADF4272
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 15:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E728F30338B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 14:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5973F074C;
	Thu,  5 Feb 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="meM0fREY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74599263F4A;
	Thu,  5 Feb 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302137; cv=fail; b=gUfLJtprY1OtgY3wR9TUmdKr/1rM32wQCrB+NvbD5i0BJv2cwvQfvBcOySEaBiPeJPQz4YG55yep//LB2C1gaPa7mbTcxwmTOvFm7aK9r0UuLFAht1XQq6302yFtHEyjs7mNq2sif10IXJWfd5E9nQbC1XwbIFDnC24enhuyETY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302137; c=relaxed/simple;
	bh=JfBPpzQzmY+9imZs5QKv8Nrg35w6qVn4CDylN+m+V/8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UXMIc8WveMS1U/5etWeTwteoU9mC3B1OJ1frOoTUfOz6iYC5WjPwrC/IKRxJmpmnl5psAkFADLQNNo/4iOCuKY2Tvv8/3BGwFYElOmTo1jF45hJAT0G6LjcB/YF5VeCqfmN0kMiDBkxfk+fou2bfoLqA0heYN2aG6gU3Wjz7kZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=meM0fREY; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdPsJSLQkMzJHO6/Ppfra7Gjh91IRjQN61bkw37hfvz1Mp7Wy3JzzD9YvXd/w0LyXyl/qoQ9ZfE0SF/8R/r3GIPnqLKrk3c1xghcrMOprNfvFCbSzFlVm/vlkO6eOINgg0FxSst9VS1zJMWIoM22XjpG8IRC9yPVXdHZ4SfqZuO2B3Qbr8clfd+M6+eajZnsctIz0V4QqPr6YKvOKkkxTAmFgVerK+qbdF0R35wgjypuy1JjmO0Mzn4nlX9cva6d5XNIswxfTQMarb56fq2IVlx7Ki4n9ygSn5GSbs2n1NymabpRP0DdPFZ9EL9RX0kq50OZ30t4/7WVeCPmnau/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfBPpzQzmY+9imZs5QKv8Nrg35w6qVn4CDylN+m+V/8=;
 b=C4ZO6m4Xz0zYZLSMTR+nKBR7M7UKfIKzvbQ79cwJjE+BrwrIbeAlr7WeYCBrBVvZhBM1OzACrpsWXhCnZ+fcd+nmyUhBNBcpMzgJslCTgnmpMCLsbvU55PU2vP4j0T/xSFCssrMRe8XwODOXHxs48yBMjdY/pCV0Opueca4EjlxwD2hewrP8fBRrNZsJKuBYDM3w5Asf5743WoWbL5CNasCw+OtkrJ0G/yQMWxuYMMTDdHjxiglVrlGuiJdVbr3EKXRp22MtRO8ILvvV+1MqeBaErLNBfG/ilXEH7qP45V1iymZ2IVYHG/O7mJuQFs4VDUwIakFLNuGnIFa6pAq8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfBPpzQzmY+9imZs5QKv8Nrg35w6qVn4CDylN+m+V/8=;
 b=meM0fREYtpIIV6deUOZL3hGxyvyLGFdLHE6CrMEul/ElcRhyrYqiKFJFFUIVk2+vwhQ4hu0LQPw1T1Gmno7xMFcNQmrLNpJ76n8rny9PKaJ8jtdq9dS/Iw0a8GbkLNN+JLS6IpeFnFhBJp1YpIFJelw3T5KOIbIx3B0pjdN04aA=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TY4PR01MB15083.jpnprd01.prod.outlook.com (2603:1096:405:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 14:35:33 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:35:27 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index:
 AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQIAAD2EAgAAA0hCAAARnAIAACY8Q
Date: Thu, 5 Feb 2026 14:35:27 +0000
Message-ID:
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
In-Reply-To: <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TY4PR01MB15083:EE_
x-ms-office365-filtering-correlation-id: bc72b87a-66d6-48ff-e436-08de64c3ce29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rzh3M2tMZTEybVpBb3JrWnJQaXRkRFd0WGlEWFJKSWl2djhEU25oaUI1TVA0?=
 =?utf-8?B?Rzl1NllPVFdoc2NXczZOTUVTZlVIZkNBUi9XSkNEY2RxQVJzNWdCSlZtK3ZV?=
 =?utf-8?B?RFVOTDZZd0s4UEcyS0p1K2oycnBPRFRIVkxHcUlIYzYvbkdRRzE4a082Y1FH?=
 =?utf-8?B?ODNYYUdING42TnpuOUx1NGx4MkFYYVZjZ3FmUU9mZkhuQVlLQ05kVzIrQXRr?=
 =?utf-8?B?MmlFY3N5ZmUveHpMZmwwZlk1S2NJY1ExTDA4dEZZV0pQRVhyUWt6SjZ0Mkww?=
 =?utf-8?B?WHd2dFFUZzA3L0twQVJ3SG00dk1wcDd2QjlzekFKcFRIZ2NUSjBwRkc2dnhF?=
 =?utf-8?B?WFVhN0t1VU5NZlpKTC9IQ0w1U0pLWkhBZTgrWklSclI1eFUrV2R5dGRtazVW?=
 =?utf-8?B?OEQwaWNqN0N3Ykw5QnkvSHc3UG9WejQ4REI0RzBDOVE3OElSRERMUGRKK25r?=
 =?utf-8?B?NXBFazRDMm5rTTFjS1FWZFE0VGZiQTBXT3U5VlZ1OHovQ0toV0ZKcUJtbGU2?=
 =?utf-8?B?MGppOWd0aCtKNWNSb2pkTTdEQWQ3dnl4VnZqQ2lhbmZaTFRsS1BLY05TSzJm?=
 =?utf-8?B?ZnZ0WGZQeG55cUFvRDNJRVN6VEwrSEJ6cUpLekh5SGFaM3VDdEJOZm9DZ3A1?=
 =?utf-8?B?c1F1RjJ6Mitqa1FObEpsUVFqUmZXQnpTYjg5N1UrSS9pQXlydVcvbkw1a2xD?=
 =?utf-8?B?QjFFaXA4R1NHMUtOZFVZaUduWXJuelhUVFJlUnV6L1BkZ0JCY1doMk9DOGJt?=
 =?utf-8?B?SzNteDdvTUdlMXZMdzdmb1JUSjlHN0RrbGh2V21wem1QWm1zZHVndFl0SHBa?=
 =?utf-8?B?SU9ucDRGUzA2K0RpL3J3emF4bnJDb0F1SkF3UGFhSkw5V3BWS3pybno1N0tk?=
 =?utf-8?B?MU85VDlMOVA2c1BDMWhZc3NkekFZN2trUFRWN2ViVmFHUEJpQTBOTU5zdklC?=
 =?utf-8?B?aGUrakM5T0VCNDVFVjBWd2Rab0NiaUVWSVBzZ2hLbUl1RU9HQXZhaGxZbUhR?=
 =?utf-8?B?QjdRdkZVQ1pYVDlnMnR0N0ZVM1AxN3JXNm1VMUxsUkUzcWhBWkdEeEhodnUy?=
 =?utf-8?B?eUsyK053OUFjVmFiRllXR2VIVXl4WjY5WlpoRVZDcjNEektwQXJ2QlJ3Y1ps?=
 =?utf-8?B?bStwSTF3VDdzekZjbkQxSmxZK2syVzVVTklDR2Y4SXpiaXl0K0REUjRtc1hJ?=
 =?utf-8?B?aGNTWmxxVU1ucFNPR1BNcnBLcU8walk4VzJFY3pUVkkrVCtCV1E2VHpwMDNP?=
 =?utf-8?B?UE5NRlBMV3V2T29hVllhL0xrN2duN05xVmNxRHY0NFhWMFpqNXB4K055TVB2?=
 =?utf-8?B?M083WFdIRS9VM1VHcllGU2x2bC9RanRjRksrTkdxc3EzaWxQbUJBLyszNTNQ?=
 =?utf-8?B?ei9UQ2QyaVlOb2VyTHI1R1drTEZLVFpmQXVFenRXcWI5anJ4OGlDWW1RN0E1?=
 =?utf-8?B?SENtQTdjV3NCd3llazF1cGRGSnNhY0JYMTRoQlArTjhLanR5d3VoSHJxRDNS?=
 =?utf-8?B?c1B5UVpwMGJFUmIxZkUxTXBoT2ZQNXpUcy91Mmp3WEIzQldHYUp0Qzh6R28v?=
 =?utf-8?B?NFEyeHppRjVsVi9PL0ZwdDlzbUpsaHY2YUdtaXE2Ym1GQlJYMkRmMmlBN0dw?=
 =?utf-8?B?N3dLZkRWL1VCVVZYUjZPNlc3NXBRUWtzWldlSVpQT1VVb21CKzdidWZXNnEz?=
 =?utf-8?B?MVlsNkNvQjBWcUl4ckRXSDJZMk01WU9TWmRHdEZtb2I2clV2VVI1SlVmK2Jn?=
 =?utf-8?B?Ynp0eEU2b2d6VVZUYXNwS1lXMHgwdHMrSlFEOGhqTVQvWW4wM3Q4Y0VFNnpy?=
 =?utf-8?B?NU5oQm5tbDVLcWphaUZUS2Q5S3NXVFZnOVltZjBFTSt6eVVrK3VRTEI0cXJr?=
 =?utf-8?B?OGNtRnZMMEZIbkRqb0ptS1pCSkJOQW9sS0p6aTVZcHM5V1VIYlFjYmF5d0NO?=
 =?utf-8?B?aElpeDQ3YytkbVdteEFaVDVHWEZtUitkWFdLUlJHOXAwNHJHbjdyKzA3cFNB?=
 =?utf-8?B?K0IxZWp1MklzMG5DU2JvVm5hV2oxWTl5VkxIY0p2cFU5QTYxNnppRUZ0dVRN?=
 =?utf-8?B?VXJMc1hzeFZweCtOSks5TlZ1eUFtY1ljTElhc3hubFIyZnlYdm1FZmdDZFRn?=
 =?utf-8?B?clhxWU5DZEJ3UkF2bGlQaEZ4V1pmVWUrbkx1NWtuck0wbURjRnRkY3VjaHV2?=
 =?utf-8?Q?Z7vtICGl5WKQSbQDsrrMfVQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUg1SzhKUnNVV2VEWld1ZGIyU0tqYlBGRTBvbzgxYlRzcjJTUjAwUDFXU0ZL?=
 =?utf-8?B?RlZNMEh2TkYvdk1pSGlWNEgwY3paVGNpZGgwdmhSdy8rQ0xadk1UVWFSbm05?=
 =?utf-8?B?ZW04UG11dW1Wdm5mRS9zVnBtZ1Nkd1pWNTd4QWU3VndzQ0VUMWJidEhreWRq?=
 =?utf-8?B?TVdsUWZuYTd0dFA2V2RiTGZCM2xDOFVoN3MxMjFVUTRZRE1pV1h2SXdpR05v?=
 =?utf-8?B?ZlRWM09ZeDNDOEJiNXFnRElnM0RuN3NBYWI4OUJXcmltRmF2cVNhSitPMktE?=
 =?utf-8?B?SEl1Q1lGbmJsb3J5aituZ3FYUldSaUc0djNhbWdhekNTZXpQdVZ4RGhjcEVj?=
 =?utf-8?B?VmQ1bWh4cDZoZmlxN3dFbXpwMzVtMFVpaytxc1oxMHVack15Y29iVHR2MEFq?=
 =?utf-8?B?SHA1d0RJMFp5WG1rZkM1bmxXRmJIQWxrdE91NWRCVmViNWNXWUtTN1RNTGps?=
 =?utf-8?B?UWtXMjZPcmdCWDlsVEFFL0dhcklsZjFEVlA4YmRvNlR0Y2M3N3dqUDVlV1lW?=
 =?utf-8?B?aFJiZGorVVNreGNOMmdtWlFVckJQMjRzTm1WNzZHQkNyV1lseVNianJkcEhr?=
 =?utf-8?B?eVdrcHJadnNiMlkxRUdGOTVpTGxRV2JXdmdRRTN6N2JHS0k1T2VCMjZjb2ZY?=
 =?utf-8?B?eUpPeWZ5ZWNCS3hBUGx5bktYb2hjK3ZtMlE2eCswVVNNdE9BUStRK2tXVXFv?=
 =?utf-8?B?eVVSOThzUU1ESWdURVdHK213NFQxSlQ5WjROUzIrRmpKR3NrR0dIOEkrT29R?=
 =?utf-8?B?NGdZd1RrWjRPS2dEYzRXUXRmWnE2K29oT0tvL2pUTmhWNGtDQkszRlJBR0dY?=
 =?utf-8?B?enlVNG9NbE5KMzJockhtc3V4WEw2bkxMczZGbkNtZFAwVmZ0SS9SRjd0cGxx?=
 =?utf-8?B?TUMwTUZyd0xlSkh3Um5XSXBOWUVGWFMvWVF2L3N2QjV6YmYzQmVYbE1rek9J?=
 =?utf-8?B?b0E4NTU1WndyWERWNTIvNE9UVE5vWTZCbWQzMExHNzdMNk5pZUdVM0RYWURi?=
 =?utf-8?B?WnNGc2Z3bmR5M2loMlh6ZFQ3U01zL2c0cGhsR09zNGVZZ3kyczZCRllSc1k3?=
 =?utf-8?B?Z3lWU2ZCL3ZoOE9XeHRodlNCVEtkaUJzdUtRQng5QUJ0d3o4SWlmRjZrS0JK?=
 =?utf-8?B?S1ZZbmRtUlJNQ3pHdkxjUmJwMm5NaGh0MmNUY3NZN0diSUoxSzRjWDZNVCty?=
 =?utf-8?B?bFNaczh4ZDNVMWNyaEIvU2VpYUx4WU5rcmhIK3pMMCt1OXZDSXdKRWRNSklJ?=
 =?utf-8?B?bGtOOVQvYmdqN2h5VzY5OFVDZmlMakY0aXYyZnZJT0czSElmZTd1MzVxNEtG?=
 =?utf-8?B?NmlXSXl5eTFRNFNlY0IrcVRUL1Vxb29NZmhOeXA4UzI4akEyTnIxMWhLTmJq?=
 =?utf-8?B?UHpLYWkxaFhBaDQ2UnlMbUl5c1BQSm9lRGtWS3kxV0dxK1pPdWhaWi9yL2l3?=
 =?utf-8?B?bkVtS1B5dHJQNWdsS3c0NXdqelk5MjdnNWU2cExzazcvWGxGYnR1T3U4djRu?=
 =?utf-8?B?bHJuYkxsNGhxZWVFS1QvNng1aGZVNmgwNmRPY25FY28rUlg1VERrdXBKMUg1?=
 =?utf-8?B?TlBOb1RDSHVkRjZjOXc5eFBUTmJpNGx5WWRyQ1M1UE91TGpsQ3FuU1c2aVo4?=
 =?utf-8?B?TjBlSThZM0FQa2RXV3ZETFBOSkdEZlBGUGRETlhjWDBIUmt2SjJQRjl6VjFM?=
 =?utf-8?B?N1o5Q1lncUJ5ZDcvYUhQQlRMVGZaZUhid0F3eWc5VExrM1F3RHpUTEZSaCtB?=
 =?utf-8?B?OENTTzBiQUF5V05xSlNSUjNBT3BUNTgwQTByNTlRcndGckVTeDhjWHltbWc4?=
 =?utf-8?B?ZnVpZkNqZ1E2dkh0dTViWEphbzZRQnAxTmk2REhtam9sSkdueFI3MzZ3UlFj?=
 =?utf-8?B?UmVpeEtUWWdvZXU3cVZuZk8rbDlnVWpYdFY5YmxNWWFKV3F5N2l2MFAzZTVw?=
 =?utf-8?B?R1dMWGl3Mm9tMENUU09haXhlai9LUmRCUVRpTzNYR1duOS83WHQwV3FMbEox?=
 =?utf-8?B?azc1NUxKVUNaN1E2eXBQbWJKMUJLNXdaOUwrZEVPeXR0NHphc3MrWTU0WUQw?=
 =?utf-8?B?L0g4VStaQ3hKWlY4OWFIeWFIUllLVUtxMjI3bDRZcitlVUM5QTh3OGZEa09w?=
 =?utf-8?B?S2NmdzIrTTJjSWRNN3JpdVk4TDl6T3VzWVh6Y3dEemVHWUsrQThNSm1lWThm?=
 =?utf-8?B?aXVZVlZ4TTkwOUM1R21kWXBaa2Z1OGxTNVNodjZWTnJxalkvWExsVnluaHhv?=
 =?utf-8?B?N1doamgrVUFCd2d5MGQ3U2JUS0gxeTZSTFJVOFprbkRLZkxYVVJCKzBxdEk4?=
 =?utf-8?B?cXA0bHRkaG1NeEUrd3RQejRXVG9wODN6V0tFSHlwMWJwVG55b3h1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc72b87a-66d6-48ff-e436-08de64c3ce29
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 14:35:27.3034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/PVlP4bCvI82rCoIKvxou4LQMn/IqF6azJ2DpeunMDdskScDri0FHCWswjD2ZQy+7c8eVqiMdOWuvl9zSbL0NHCPmTrF2uhcE1JqJ8iHPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-27953-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cogentembedded.com:email,davemloft.net:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 54CADF4272
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TmlraXRhIFl1c2hjaGVua28gPG5pa2l0YS55b3VzaEBjb2dlbnRlbWJlZGRlZC5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBGZWJydWFyeSA1LCAyMDI2IDI6NTcgUE0NCj4gVG86IE1pY2hhZWwgRGVn
ZSA8bWljaGFlbC5kZWdlQHJlbmVzYXMuY29tPjsgWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPjsNCj4gQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZA
bHVubi5jaD47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVt
YXpldA0KPiA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+OyBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENjOiBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXRdIG5ldDogcmVu
ZXNhczogcnN3aXRjaDogZml4IGZvcndhcmRpbmcgb2ZmbG9hZCBzdGF0ZW1hY2hpbmUNCj4gDQo+
ID4+IFF1aXRlIHN0cmFuZ2UsIGlzIGFueXRoaW5nIGVsc2UgbG9nZ2VkPyAgRS5nLiBzb21lIG1l
c3NhZ2VzIGZyb20gbGludXggYnJpZGdlIGxheWVyPw0KPiA+Pg0KPiA+PiBOaWtpdGENCj4gPg0K
PiA+IEhlcmUgaXMgdGhlIGxvZyBmcm9tIHRoZSB2ZXJzaW9uIHdpdGhvdXQgImlmIGVsc2UiDQo+
ID4NCj4gPiBbICAgODMuMTA3NzU5XSByZW5lc2FzX2V0aF9zdyBlNjg4MDAwMC5ldGhlcm5ldCB0
c24wOiBMaW5rIGlzIERvd24NCj4gPiBbICAgODMuMTA4NzM0XSBicjA6IHBvcnQgMSh0c24wKSBl
bnRlcmVkIGRpc2FibGVkIHN0YXRlDQo+ID4gWyAgIDgzLjEwOTY2OV0gcmVuZXNhc19ldGhfc3cg
ZTY4ODAwMDAuZXRoZXJuZXQgdHNuMDogc3RvcHBpbmcgaHcgbGVhcm5pbmcNCj4gPiBbICAgODMu
MTEwNTE5XSByZW5lc2FzX2V0aF9zdyBlNjg4MDAwMC5ldGhlcm5ldCB0c24wOiBzdG9wcGluZyBo
dyBmb3J3YXJkaW5nDQo+ID4gWyAgIDgzLjExMTQwNV0gcmVuZXNhc19ldGhfc3cgZTY4ODAwMDAu
ZXRoZXJuZXQgdHNuMTogc3RvcHBpbmcgaHcgZm9yd2FyZGluZw0KPiANCj4gVGhlIGRyaXZlciB3
YXMgb3JpZ2luYWxseSBkZXNpZ25lZCB0byBlbmFibGUgaGFyZHdhcmUgZm9yd2FyZGluZyB3aGVu
IG5vdCBsZXNzIHRoYW4gdHdvIHBvcnRzIGFyZSBpbg0KPiBmb3J3YXJkaW5nIHN0YXRlLiBXaGVu
IG9ubHkgb25lIHBvcnQgaGFzIGh3IGZvcndhcmRpbmcsIHRoZXJlIGlzIG5vIGRlc3RpbmF0aW9u
IHRvIGZvcndhcmQuDQo+IA0KPiBOaWtpdGENCj4gDQoNClRoZSBjdXJyZW50IGRyaXZlciBhbGxv
d3MgTGludXggdG8gdXNlIHRoZSBicmlkZ2UgcG9ydCBhcyBsb2NhbCBwb3J0IHRvIHRoZSBicmlk
Z2UuIFRoZSBvZmZsb2FkaW5nIA0KQWxzbyBzdXBwb3J0cyBzd2l0Y2hpbmcgdHJhZmZpYyB0byBM
aW51eCB0aHJvdWdoIHRoZSBicmlkZ2UgcG9ydC4gVGhlcmVmb3JlLCB0aGUgb2ZmbG9hZGluZyBz
aG91bGRuJ3QgDQpCZSBkcm9wcGVkIGlmIG9ubHkgb25lIGV4dGVybmFsIHBvcnQgaXMgdXAgb24g
dGhlIGJyaWRnZS4NCg0KQmVzdCByZWdhcmRzLA0KDQpNaWNoYWVsDQo=

