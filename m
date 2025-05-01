Return-Path: <linux-renesas-soc+bounces-16554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F79AA5AB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 07:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A46E4A49CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 05:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4058725484D;
	Thu,  1 May 2025 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Zk6qbRqe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A080225A2C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078981; cv=fail; b=rMh54p1ecig5AC8oP45ZLT2mLumEz1Pj/7drT97021+FE85zYLbahuOWyU5fiZXahoi3vNhX/9cI3arJrJjmgUXHhAXCGw8PhBfgyfd9eZnEy+37rXyFJMZnsGLBk9ACTgHZUncJLb5A4sPlAscQstJ3ubUB/DhFUfQwqsD0xlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078981; c=relaxed/simple;
	bh=0IXpWn+QkLwAh+vYMOm1P4pGJx0Jv4raqidK9ngIcB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rnnM1+qfDdj4z4DqI9uPDlGo9wImb0sdsw8sAsz5gk9YnxWaM5Q7XppvVSq6CPyxdtUqpN/6YUi79puIXiz9uYopPthOyyQHbu9bsBVc+BRd/wOXbk90XapUq75WUJIwa6leP+wCPoUtU6y2etkxzbI46AXI8f4af/BMWYcNGMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Zk6qbRqe; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctNeUD7E+BB1OuhTbggBQ1IsVb7bh6V2FKiWxpo9kLliOrJ4xaRuqcButLVq0326n3VM/0TQkKaWl4H01KIBTxyAB64iauYN6FQHOQmy0f4bO1zl+wiDk/MQDqZDevEh4qYrXzLbj9BYYChbMe+rqlZIX5clw3P07Om+99OcLXoWb2IR6OkOeNgIV0GI7RzK597A4IWrPDvg34HQ6w8XlfyyuVeZjKwweeFnPBLmAIIth2QIU9BFuk8oZCX90HPsVswCVCYIVOHOd2XLV5tqsSxZF7jRWjoxsLrlMK9UcbLgjqqG0qHavuhjjAqMb9AghFDT5XxdxNKVDOMC6UiXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IXpWn+QkLwAh+vYMOm1P4pGJx0Jv4raqidK9ngIcB4=;
 b=nX2KARzMv9qdf6w9WTY66azRfhm1mQWxLcTmITbHmj3+9MxKiDQtOB13TVvkdrAcxlZPXOKnpIhu8BfN5H4TCRINB5x5ILpfxGn0mzLRcRTSE7OdoSfUPSOs4fGvnPyz0/778mPewqa+/PTqei17oS5usa4y3M+NKFGaggfHxJ7tEphfGVQgeZnQK5ejB4Twr52UcFP0nAotCnc0K5ZbvNoqoyxPWTRl0+SaNpOJ1DbCoxzJrSO2QOjk9TttQUoani1aY6kptDplLeppsRn4KWl2EdXNUlEKDJNALR5skE6ZhmV2Ag/COYD6GeyW7LBkr3+mQInMIA1n7O7zNbTjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IXpWn+QkLwAh+vYMOm1P4pGJx0Jv4raqidK9ngIcB4=;
 b=Zk6qbRqe4npl87Sk0NtSLu8/f49/ow182omJVc/30KYuqWCNfGYBKvkuCLtZkaU/HUTjYHo3Z2OPcFp5Z3RtJLVKiZuWpdsE9py1iwroBsVkhQDXuWJV2aLsCNVQ+v2kZ5exkLhvpKG4DLdFFn2zqumlQTlvJuRk7Sl4P6NbQyw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12439.jpnprd01.prod.outlook.com (2603:1096:604:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 05:56:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 05:56:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown
	<broonie@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 3/7] memory: renesas-rpc-if: Use
 devm_reset_control_array_get_exclusive()
Thread-Topic: [PATCH v5 3/7] memory: renesas-rpc-if: Use
 devm_reset_control_array_get_exclusive()
Thread-Index: AQHbtPdNt4hOsvEZ20yMjqoHvVX7lbO8loCAgAC6miA=
Date: Thu, 1 May 2025 05:56:08 +0000
Message-ID:
 <TY3PR01MB113467180200ABDBAEBE4C88886822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-4-biju.das.jz@bp.renesas.com>
 <0aefc729-868c-4301-8519-8c46f67d5f85@kernel.org>
In-Reply-To: <0aefc729-868c-4301-8519-8c46f67d5f85@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12439:EE_
x-ms-office365-filtering-correlation-id: b9d75845-2e01-459b-0131-08dd8874de22
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHFaNGd6Ny9TZmJ1bUdQRjZjQ2Z5VFNMUnpDUXZnSVdqMjF6bkFqZ2p4M0RZ?=
 =?utf-8?B?eHU2R0Z3STJtcGJYTFFSS3lnSTBnWDlSUXNabGZqc2U4NHY0TUFnbmt3cXcv?=
 =?utf-8?B?dlpGdHdwNlJpTXdubU44MGFUNUJhejJxd2FKTUxPWXNyUWE3UTVZZEU0Uk5j?=
 =?utf-8?B?Y3BLdjEwMFN4a2JvUXBPL0lqdE9vTTB6RjViR0tNTCtnS29iY3p6d0ZlOG5M?=
 =?utf-8?B?a0VwbXAwV0NtZWhINkhsbFZkOVIxVzBHT20yMkpCdjYwRDNTZnllM1Nlbkox?=
 =?utf-8?B?dU9WNjhEOVBnV2hNTjRubVRzc2V5cDBjS3JmZHRMcjg0L2Z6bHFxekJDSGgw?=
 =?utf-8?B?RCtQb3kyY0ViWlhHR0xBTnZJcjZnTWRrZnQvbndNWUtyR24wVm85THhUaGRK?=
 =?utf-8?B?bHJ0K1NLZWE1Q2lTWXZMZEpUMENIeWt2OEdFbXo5dVY3cTUwSndhNXB1VjNG?=
 =?utf-8?B?U1JodGNaTzIzbk84UGdMNnM5bTFqZzNhR0grVU1QMzY4MFZaK0EvNGdHVXor?=
 =?utf-8?B?NkptdnJqbklsUmg5THJ2VVNOdGh0eDNib0tvQ3NwaEJPWkgrTHpXUkdCdHFK?=
 =?utf-8?B?RjBNaFJFRXJNR21VOEJhLy9ZV1VFU1UyWWZGVE5CSkJqWnlTU1d5aWV0aU9T?=
 =?utf-8?B?SzhwN2ZoNWRER2RHeVdrL2JSaEFuZS9vS2VvcTZiK0tGcjFYOEMxMG43RmFP?=
 =?utf-8?B?dTdtZFovUHZHaVlVZHAwZzZOMEV1TnVSQkdYZFJSZytXVkdBVVdQUWtqbnht?=
 =?utf-8?B?ZllPbWh0OUFOWElqYUlyNitJZk1MWkVUV1VNUmxnamxmelc0L09KNFNsL2pH?=
 =?utf-8?B?UDVOWExrN01rMVJSR0hVWjhKRDdBTEY1bnVmbitYd2VTU2xJaGdLeGFtN29L?=
 =?utf-8?B?bXlWK2pNdEIxaWcwV1dZTTUyR2dlUS9DTDNXMVhJMDdIMmFNdlhkcnRGVEx1?=
 =?utf-8?B?eU1kVXo1YllLb3Y0M25JUFRNckpRdmh5RGZUWmkrbzdOT1orOE5wNlE4bEsz?=
 =?utf-8?B?T2hQZkJxYVE0SXlKTDg2YmVKUU0ybDRndW9Jbkd0VCtrNUxUSmV0MDB1R3B0?=
 =?utf-8?B?d1JPQ3RxU28yTVYxZDNEekoyb3hhcjdwUkc5UWJmOVY3YlZGbzd5dVRzVVM2?=
 =?utf-8?B?NG5wczNBMHYzQWRMQjZRZGI5RCtleWVXRnRUVk9tYTcyc3Yrb04vVFB3WENJ?=
 =?utf-8?B?Q3ZSS1R0eEhoMFRwVWtBYm1OUmdLQlIxZmZnZnpyT0FkS0ZrblNDTSs2eEhj?=
 =?utf-8?B?bEtWK2VjTkQ0QW5IZHEvOWhPSGE1RWU3UDlmR09lMnNNaXJieGZsbFoyaDFo?=
 =?utf-8?B?WVRpcDdnTFlUNWNibHUvRlJ2SlN1Z3VmQVZ0Sk41S1c1Ty9QWGd6WTY3bWFQ?=
 =?utf-8?B?eGlRaHYrdEg3N2ZlbllJZ2MvK0VySW9DaG82alc3VEpnb29nc1ptOGhlVWRZ?=
 =?utf-8?B?MVRSekhwb0VDMkFPN2h2ODJuNVpNcFhEOC80LzRLVFFtOHdZZUdIY2pTbGtU?=
 =?utf-8?B?Ui95ZktmOVhRTkhSNUFjdU00SURHSUNGR09Ba3RHNS80bFYzQjYwZjU1M25Y?=
 =?utf-8?B?WWVQUkhSNFc0RVF1SWhnS3pLZEpRSUJYYVprenpHUjU0TnI0RElMQVJBWWZJ?=
 =?utf-8?B?MytWNFM0bCs4WmFEa0lMYS9BQVBvRndpYTR4U3Z2TWlyNGlLajUzdVdBdlI4?=
 =?utf-8?B?N1dCMk1URVQ3N01OcFFySzlJR3hNUVpHRzlzZ2xHZi9ndTdVZkpUM3VUTHA3?=
 =?utf-8?B?RmFrc2VMbWM3eTQ1M2w1QndTdHhVSklxSWUxQlB3YW5RaHBXQ0hFWk80SnJZ?=
 =?utf-8?B?dFRZMlZseDMwOHh0bjAxOS9HZ0hVRUNjSGhsRmZlOEVGc0lreGxhK3pxSlpP?=
 =?utf-8?B?Q0RYNmlWNERMeUhBYWttMktyVkxlYjRJZHlMbnRDWUFwOWQvMWExLzRGelZl?=
 =?utf-8?Q?muM82ksQ746szcKk1BfPt7vLKP59he1f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emY5bDRQQjJVdHFHRG83R2lZNU0waUhOVjAvYTh6UU9pMWk2cTAvVWp3Z2Y3?=
 =?utf-8?B?cXcvbjhCaFIxbHQ3WFlPaHNaaXpFMlNNWUNKemxoZDh3RDZKUG83cys2Qnk4?=
 =?utf-8?B?WVdwaFhHUm9EdkJNdU0rMVBBV3pZTnVoN2lsTERNbVdGNEU2QmVXQzIyWVRq?=
 =?utf-8?B?SWxmTHNLbjFoUy9Vbm5GcHMzYzluNlBuNTg2UFNGMjREZ3JEMFhHNFowU0Y0?=
 =?utf-8?B?bSt2d3VsbUpKZVNRdzhrcFRLZ3YrMmYwSHErbEFkdlFPK2xVaWRQbTNLNnAw?=
 =?utf-8?B?MW9EeC9PaUZDcE02OVlJTlRaNXJiMDMxaTlNQjROeVA0UHJ3bjZhT3N2eWtD?=
 =?utf-8?B?eTI1R3k4UC9GTS9pYUN5cTNEMUE3Ty9SSUF0OEsrN2pVaTZBL3FObmRQTFJH?=
 =?utf-8?B?aFZNdUsvKy9FeWI1RnM3Z20xNzJyYlhjUzFLZ3RtN1FZS3RlVzl0YkRTL0Zi?=
 =?utf-8?B?eTI5ZndQbHpVbFgyTlNGR2ZURG40UFBPY21EbWFOazYyQUtWWFZwbm1KYk51?=
 =?utf-8?B?TWJtUnlPOFF6SGxET0wxZzFqb2dIaytLejFLcXNCNG01RHltcUNFRHcvelJz?=
 =?utf-8?B?Ump0TmQvWkUvV0crSkRITUhnVkp4OFh5bDYrT2dDRlhlQXJzQ2xaZHdQMnlx?=
 =?utf-8?B?NHA0YnRuYjdFL0Frcnloc2RuZjFpOWxKRVpKUjNLTi9LVVY0cGtlRWZVdVpF?=
 =?utf-8?B?YVh5aUhaVmx5aXJhRFN0UnlyTTFpUGg0ZldTbThoQlU5aDJKQmQrVFRaRElt?=
 =?utf-8?B?VTlvZWMreVlPanNYNDVSQmN4WkxOdE1YbnhtMktQSmhsaytrZHlRR29Jclcy?=
 =?utf-8?B?RVNBL29aNlBNQ3ExTjZvR2Uwb25UVzdQWXNtMXVPeUVWS05JcWVvQk95RGFv?=
 =?utf-8?B?OVJDSzJ4OEhiV0RBaHRjTENmUzM2RWNOTlFBdDViRHJONlZyVnhwUzczcXZh?=
 =?utf-8?B?dmJQNGVyQXYvWFVCQUNsMUZBZjJxZ3g4NGkwNHdPbGtUNFk1RDUrSDBodXo1?=
 =?utf-8?B?dDh0aDVZc3ltWHcxeTVWTHZGZnRrN0JlSlFrZStUK1ZKa2JtNGd0UVRxU204?=
 =?utf-8?B?WkYvOWpaTHBBdTl2TExLWGtWRWptOGF4cWR4Qk9NbS84aWROZy81eTliNnJk?=
 =?utf-8?B?ellEbmNJMkY0SEZ5d3JyNC9vOHZQUDB0Ky9tZ05SQXBlM1Q2Tzc0bHN6S2tP?=
 =?utf-8?B?VVR2UmRScndJVDVreHJwc2wxOUFZdDlRcFJBL1ZnUXZ3eThta3hiVS9tSFUz?=
 =?utf-8?B?T1VOMzhpS253MWp0dHVvd3ZtY2NQeGIyZWhBVUQyYmI4UElSNVhUNHVPSmRl?=
 =?utf-8?B?cXJyYmNtS2g2UGhRVVBRUGRUakMvdVMrOHB2RDJhaHNkOVdNbDVXWkRZcmQ5?=
 =?utf-8?B?eDBaeTJXNFQrMkNiN1JTcGNuVVNiNlpsNHFSMTArZGpsYlN4Z2JkQTNVN0ZZ?=
 =?utf-8?B?UE1NYmY0VCtiQTFNVjhCLzhCVTdXRWRiNGhhVk5RUU8yUHFUZnNsZDBZUThY?=
 =?utf-8?B?YjRKcXpOTW90NHhJdEdMWFdzM1BHRnpsWkgxbnJaRExMRXBPdE5wb3VPdk9R?=
 =?utf-8?B?Zms5Qjl3ejBZTkU5UlpHajJSRGlBaktTbThGN0hZWUExZmdTVW93N0h5QVRO?=
 =?utf-8?B?cXliWHAvWDN6RldJdWpwOXRRUlluUEJuNGVGUHhjKzAwUHRTZ3k4NjFBb002?=
 =?utf-8?B?Sk1abkRLMFkxelZud1hueFhrTDBOZlo3dnVYQUk1Qk00c0ozVDNIWnNNS3lU?=
 =?utf-8?B?VzFSYXpSb25IL2FWdjBKOXk5MFoxRkNtNXBreGN2blc2Uk5qdmhnWDlZSmZN?=
 =?utf-8?B?MUpGNjlaK2dTeHFVSXFpZm4zejdQSkRrcWF2dGdIM2hVU2ptY2E1SGZLa3RV?=
 =?utf-8?B?ckthdGtvOXVQZUQwdTNvZXAzSjNHTzhyZG9HdDNienVtd2dYQ01sS0lUN2Ez?=
 =?utf-8?B?S2pzQmtqT0o4TTB1Qko3bEQxcjFxUDR2TUtjNGw4T3FZVm4zVWJPMVV6YkdN?=
 =?utf-8?B?cEZ5ZFJzaXd2UlhCcVNtOS94dW9NSFdHdWwrVW1aNGtPeHB6bFVKSGpzNkJH?=
 =?utf-8?B?V1dZTDd5bW1Nd3MzQXorSWI2U3lvaHd6WDd4dUNCYlppM0pYdlVpQS9acEVV?=
 =?utf-8?B?UC9wNk8rRDJTWDFVUkl6dFV0T0FaNnlNNnJnWEJCYi9GMGw5aDBpUW5veFhO?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d75845-2e01-459b-0131-08dd8874de22
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 05:56:08.0670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5AW6IyablKu2mwXD37A1YqfRgRFBqaGgPWm/7GDt52vVsauSNN87TuqSaBBoQpLhqLNrLAH221s6N6LNkziVvQKGA73cMFEXd+aHcCP+BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12439

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDMw
IEFwcmlsIDIwMjUgMTk6NDcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAzLzddIG1lbW9yeTog
cmVuZXNhcy1ycGMtaWY6IFVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJyYXlfZ2V0X2V4Y2x1c2l2
ZSgpDQo+IA0KPiBPbiAyNC8wNC8yMDI1IDEwOjU5LCBCaWp1IERhcyB3cm90ZToNCj4gPiBSZXBs
YWNlIGRldm1fKl9nZXRfZXhjbHVzaXZlKCktPmRldm1fKl9hcnJheV9nZXRfZXhjbHVzaXZlKCkg
dG8NCj4gPiBzdXBwb3J0IGV4aXN0aW5nIFNvQ3MgYWxvbmcgd2l0aCBSWi9HM0UgYXMgUlovRzNF
IGhhcyAyIHJlc2V0cy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IERvZXMgbm90IGFwcGx5LiBBcmUgeW91
IHN1cmUgeW91IHVzZSBwcm9wZXIgYmFzZT8NCg0KSXQgaXMgYXBwbHlpbmcgY2xlYW5seSBhZ2Fp
bnN0IGZvci1uZXh0LiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/DQoNCmRhc2JAcmVlLWR1MXNkZDU6
fi9saW51eC1tZW0tY3RybCQgZ2l0IGNoZWNrb3V0IGZvci1uZXh0DQpCcmFuY2ggJ2Zvci1uZXh0
JyBzZXQgdXAgdG8gdHJhY2sgcmVtb3RlIGJyYW5jaCAnZm9yLW5leHQnIGZyb20gJ29yaWdpbicu
DQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ2Zvci1uZXh0Jw0KDQpkYXNiQHJlZS1kdTFzZGQ1
On4vbGludXgtbWVtLWN0cmwkIGI0IHNoYXphbSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTA0MjQwOTAwMDAuMTM2ODA0LTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQpHcmFi
YmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDI0MDkwMDAwLjEzNjgw
NC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tL3QubWJveC5neg0KQ2hlY2tpbmcgZm9yIG5l
d2VyIHJldmlzaW9ucw0KR3JhYmJpbmcgc2VhcmNoIHJlc3VsdHMgZnJvbSBsb3JlLmtlcm5lbC5v
cmcNCkFuYWx5emluZyAxMSBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkDQpMb29raW5nIGZvciBhZGRp
dGlvbmFsIGNvZGUtcmV2aWV3IHRyYWlsZXJzIG9uIGxvcmUua2VybmVsLm9yZw0KQ2hlY2tpbmcg
YXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4uLg0KLS0tDQog
IFtQQVRDSCB2NSAxLzddIGR0LWJpbmRpbmdzOiBtZW1vcnk6IERvY3VtZW50IFJaL0czRSBzdXBw
b3J0DQogIFtQQVRDSCB2NSAyLzddIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IE1vdmUgcnBjLWlm
IHJlZyBkZWZpbml0aW9ucw0KICBbUEFUQ0ggdjUgMy83XSBtZW1vcnk6IHJlbmVzYXMtcnBjLWlm
OiBVc2UgZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9leGNsdXNpdmUoKQ0KICBbUEFUQ0gg
djUgNC83XSBtZW1vcnk6IHJlbmVzYXMtcnBjLWlmOiBBZGQgcmVnbWFwIHRvIHN0cnVjdCBycGNp
Zl9pbmZvDQogIFtQQVRDSCB2NSA1LzddIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCB3cmFw
cGVyIGZ1bmN0aW9ucw0KICBbUEFUQ0ggdjUgNi83XSBtZW1vcnk6IHJlbmVzYXMtcnBjLWlmOiBB
ZGQgUlovRzNFIHhTUEkgc3VwcG9ydA0KICBbUEFUQ0ggdjUgNy83XSBzcGk6IHJwYy1pZjogQWRk
IHdyaXRlIHN1cHBvcnQgZm9yIG1lbW9yeS1tYXBwZWQgYXJlYQ0KLS0tDQpUb3RhbCBwYXRjaGVz
OiA3DQotLS0NCkFwcGx5aW5nOiBkdC1iaW5kaW5nczogbWVtb3J5OiBEb2N1bWVudCBSWi9HM0Ug
c3VwcG9ydA0KQXBwbHlpbmc6IG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IE1vdmUgcnBjLWlmIHJl
ZyBkZWZpbml0aW9ucw0KQXBwbHlpbmc6IG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IFVzZSBkZXZt
X3Jlc2V0X2NvbnRyb2xfYXJyYXlfZ2V0X2V4Y2x1c2l2ZSgpDQpBcHBseWluZzogbWVtb3J5OiBy
ZW5lc2FzLXJwYy1pZjogQWRkIHJlZ21hcCB0byBzdHJ1Y3QgcnBjaWZfaW5mbw0KQXBwbHlpbmc6
IG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCB3cmFwcGVyIGZ1bmN0aW9ucw0KQXBwbHlpbmc6
IG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEFkZCBSWi9HM0UgeFNQSSBzdXBwb3J0DQpBcHBseWlu
Zzogc3BpOiBycGMtaWY6IEFkZCB3cml0ZSBzdXBwb3J0IGZvciBtZW1vcnktbWFwcGVkIGFyZWEN
CmRhc2JAcmVlLWR1MXNkZDU6fi9saW51eC1tZW0tY3RybCQNCg0KDQpDaGVlcnMsDQpCaWp1DQo=

