Return-Path: <linux-renesas-soc+bounces-4512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB78A0BFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 11:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ECD928625A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 09:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF71F1448C8;
	Thu, 11 Apr 2024 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RbAsgB/q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2046.outbound.protection.outlook.com [40.107.114.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E714431D;
	Thu, 11 Apr 2024 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826628; cv=fail; b=r9sWKBalB6K9cN6cU6cRHTNu3poxLoGjogZ+/3+CzYudc7divxs/eQ+O40tCViIBsVMKe9FbArN7yAqzrkeHjSx3khtsQo/WrdD79bcmJDHe81cM5Bn33n0pbRIG9rpmy9n9GFwR5i5k6+/5TbHaJsWLPKAI1hB8oQNLsbtay14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826628; c=relaxed/simple;
	bh=gGwz0wwQi7wDDPCiz7Dd8dpaUwsRppNwQVvaR2pRx08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e9LyBY2DTd9dOYHeZIekMKvCRk/5MOYVaro+PpUTT0iZX3cCkhQDdv6qWvo7U5nIdkTPZQxPu9CjK7MbZ/t14EOJkW0xKkaLS+/2rRfmo1hFmaIz8e5okNRl1LGxU0tu8Bo03jq74CAByE5OobsuIxH3WFzL/DoPErc5yAOB72M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RbAsgB/q; arc=fail smtp.client-ip=40.107.114.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JapH+uRSOm9gddzwjnsbIYLcF5gvtOguZLgveNQSu4m9eW+AUD9kY9jCDjgbMdThwAGmIdR+s9lwbr1XpIw51SsWExp/Szk61JQjK5RRiFjHOJlFu76GtZY/GxLDHyyWcaD2Te6Lo7nWpHMmG8Ks/ScDtLL12a3nhV0fiZHVTz37szKy4fbjlnWNfVzrPO9pmpbTsRe/EHqqZ8EP8yXZSNACPLiX5Qd8fngS8BV+0f56t+wSfatCCiI46JRVcXWCrAgOB4Io33IYw7BTsyoSI8+UTaIBw8WLTNl9XrbDDO97mvCMFgiOlLjcT4F3ILFyDmK4obgVKwOB1vtFCkmTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGwz0wwQi7wDDPCiz7Dd8dpaUwsRppNwQVvaR2pRx08=;
 b=NJ6jfYRvy0K5R+mpCII1bx3taUCmD8oyvQ8pZfJLZd/7HwN7DGU09+HomqU3Mpy39cd1wPMrNfQrEaYa7DEvK0SijXnrx24sTA3wthtEMzrYDaGiz0Z4xXh25orO+jpbH3EZsHUEu8VeS6iRLtNvzyRZOEaTXtWwLssmPlWNOTFXwU79MRYEVpAkPbV4Wfpqwmb40uTUj6hprcaTGUMVyxu7F30IAFf3oRMAryHK7VKEsK/Re3NxgDKSgShxfKEO9lX2Asxkj+/4Lt+fo0A/N5ynrQPHAKzzCUc1skPKTXJZVuS7pCaiipxdltCrCpsxB8R5HriwCPWdF0KqrmXy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGwz0wwQi7wDDPCiz7Dd8dpaUwsRppNwQVvaR2pRx08=;
 b=RbAsgB/qV1DnuCIUv/oIwffF0JCt2plEjdn0/ebYj3WxUOh0foUN4MOO0WnNLwyncvg7FIGrT0ej1JZ8dOKpXBUE844HWDPs4LLIV4Eca17YP/pQJXoSnbhuCrtAlMHpISeUk2FvJxVcONGVW1eyrAOX/qxnkKrXd3eAWhtRpvE=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 09:10:22 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774%5]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 09:10:21 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
	<kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 6/7] PCI: rcar-gen4: Add support for r8a779g0
Thread-Topic: [PATCH v6 6/7] PCI: rcar-gen4: Add support for r8a779g0
Thread-Index: AQHaiuDUYXvnpjTAcEWMkUDbcITLnLFhyb4AgAD5fYA=
Date: Thu, 11 Apr 2024 09:10:21 +0000
Message-ID:
 <TYCPR01MB11040EAA36BFE3193F4F7FA56D8052@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240410004832.3726922-1-yoshihiro.shimoda.uh@renesas.com>
 <20240410004832.3726922-7-yoshihiro.shimoda.uh@renesas.com>
 <20240410175144.GD16629@thinkpad>
In-Reply-To: <20240410175144.GD16629@thinkpad>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB9382:EE_
x-ms-office365-filtering-correlation-id: 7d2e2575-3d4c-43c0-c2f4-08dc5a073756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G+Fer/QTDdPELDeei1RLqLu8+ulZQsJ9oIQG1QgZgbovc9T/Bxh2l6n/DBW+BUWBpU7Z8UzrhfUN9kSdExVB8UEaLanap2LnHfFL9PDWVa/baox3uADur2SULSKiaATutKsEeF6cBmKWOlxC06qb6qz1l5IBlZPaGIyrJAWL+jnlbqku1b+zRokUw++otvV9sbxkmPxN/Tq+py4bXE3bwgntVaMmOXmHPj8J9RKoV6QJiDw79PUO9bcVu8bASxFajEJjRqsoW2xQiSfh7kZabsql5pNK4bPKIlYs1NcN60EwPv8VUcILTMndTAdxxAPkMTS5P33KEGd02KxcTe7RA75xOYuNZsIlhmXqlr82vvVvGO9aI3gwn7IkCi6o+PomQ0YrFoM+aryde3wEBvp3jSXPSe8DBMqgVbXRAYRLo+7qQFC0vXSIuD9L3JvfyzjwrLGqG9Sa0alplW/ljoiSQ7USSiEeWSposnLIeAqZBh/bRBlvG+XpW08g/G5KsI/Tknl0KWmeUaN+rh59bDx/9M/a0/GFDOb2wHCIU/kpXPpu1wj4Cr0XJyiy6V0qnX6k4Pd7qQ5xtcyCVKlXL+zEJTSAona3kVAmxvb+4iDh11SOgxfn8W10blU6c/+RQYKPVN63cs6oYskQG8KLz6EAuVgjibpj/bvXLFYcZ+4VNnMbx3quTFPKffYcFfwKsIVO/gXXP/HQ96/JEgutL49oTCTIK/LcKeidWiECijWLDw8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFlwelpiMS9Pb0FYNWVXeDNCM2ZMOFNOQitQYzJGMWhFTzBGS0FlVmZqdnky?=
 =?utf-8?B?dHZyU3dialhvSE5DU1p2UFJLb1p1cXZ2eW44MCt4eWdOUjB6ellvdmM0U1lK?=
 =?utf-8?B?cEVWUVJOVUFoakx6SEcxb3BNb3BDaGdRdXhxSGthZC9pcXBxa25VZWE1aEty?=
 =?utf-8?B?ZkR2RjhBS2JYcTdBUlMwbjN4VlNIZnFpWTBJV2c2eDRDVE5pd3ZiOTc5WGdr?=
 =?utf-8?B?ZVIyYVJ4SG15TDRua1RuL01Ea1VlbEpNbk14YWRPZXl1TlFpVHBXV2FKR0tO?=
 =?utf-8?B?aHgrS2R1TVplRHJnRjFsNFZuSXA3U3l1WTlwSXQycWJLUkFtUVR3TnRNWk4w?=
 =?utf-8?B?WWFNQkpLMlNyNVhhZ3ZWYlY4ZkFMZFdCK3BRMjh5a24rQUREZTZ3b0h6RXo2?=
 =?utf-8?B?dHUyRDVlMzN1RFN0MWFtUVViMEdrV1F0SzhaS3VoSjAwQzNxSW1CRG82VFNn?=
 =?utf-8?B?U3JxQVdpTE1Kdm9LSTlWVFVRN0M4WjRYcnhMcm5NM2xDTWllS0VNTXdHV2VY?=
 =?utf-8?B?bUVXcldmbnoyamp3bWlua1NQM055aGIwUjM4cE5TVDQrb3NtKyswaGtEQmlo?=
 =?utf-8?B?MldtbEdnZXFCNXczRnlIWkk4NE5oRFFyN3pmcW12UU9KMytFaW1kRjVtVkpQ?=
 =?utf-8?B?ckdBdHZaSzhTVTRvN093cmJ0Rk5lZnl5NlRldC93bkZLTndLYTBkSDN2eVFT?=
 =?utf-8?B?YnRoUlc3ODhlRXVVUEdKYTlhK1VTZEMwN0hLZ0VkVUNOaElQMDVBZEpHVkFJ?=
 =?utf-8?B?YlhPUGhaamtSTzJ2VWxacjRnYW41K3Z0SFFJbHJLWkRVRkc5YVZFLzVzZitC?=
 =?utf-8?B?YUJVY1JNbEJPdGNRNnplcklBeGx4cU9pRytqMEE3SXcyUlpQRVdZUmFYb2tV?=
 =?utf-8?B?SDlBU2ZTUGpZR2M1U2haMGVsWUxHQldtMG5ZQ0szWkw5WHBGYnQwQ2VjUjZI?=
 =?utf-8?B?T2VBdXhiYkNZak43V0RmTXA5U1hEWXl2N2hRRnlCR1paQ3NuMmJwemswb3Ex?=
 =?utf-8?B?QTl3SUp0NUI2Q2FmNXFCdHoyR3BjYldMUWxLQzNQVWQrQlpLRVozUldxeHJQ?=
 =?utf-8?B?V21OYnQva3cvZXlFQzRKZ0xFNzM5MEYvdzAwUjcrTFhtUmZNSzNUWDhKaE1G?=
 =?utf-8?B?eCtiazZtZCtOdXo1OW9iMW5PSEZXbjI4Y3N1RkR4Ym43Q1RZODhxZ1BERjhT?=
 =?utf-8?B?OXdIcFNKRlZjc21jamx0VDFQZUQ3VHlJMDlWdjFIY0dPaEtOeDAwdXQ1WUpP?=
 =?utf-8?B?VnpXeWZjU051eTQxK2kxck1Qek1jYXhscUovN0pjS0tUdnZ1aUp2TUhleWNF?=
 =?utf-8?B?YTZEVXZrOVNNaEVnR3lYQ0ZsczJ0Z1RsVWJ3MmNpd1kwN2hBbDBnRVEvSXZm?=
 =?utf-8?B?Vi91YXp6V2VkM29ld2R0RHlyTGczZUgwTGdTTDVIQkxzb21BeC85QUxBOWdS?=
 =?utf-8?B?OHgzTnprTmlaOXUxWXdZNVRNZ1RzRzV3Mmo5VTBkTm52RUdxZmM1ZFJTbkV1?=
 =?utf-8?B?ci9LTktRR2lYL1AxZ0t4Q3hzZ2huTEMwMkc2Mk4vZlZaYmE3eW4yV29udzYz?=
 =?utf-8?B?aDUxQ2hyakIzdkhnUHN1UytQOEY3RUZSbEo4Wk1LWStzQ3Q0WEtSYkMwV1M5?=
 =?utf-8?B?QlNBY0RFNDI5UjJFanFCcm0yR2czRlVZYStKY3FNU3JzajlGcmM3WnpEY3E2?=
 =?utf-8?B?aWpPQytZKzBBOUZGQmtQb0dpSnd5Z21RZnoyTTBzNUN1QnRPZTMxendBZlNz?=
 =?utf-8?B?VXY5bmhqaC9FbjdQUFRta1NPZm5PdGRSQkFkQjg3QTVIeUFEZ2RscDZ4ajNn?=
 =?utf-8?B?TjdFOG5rS2dPVU8zRk9mWkRRNS84b3RidytJdjhoUnlIcHdoRUN2L09HTXRG?=
 =?utf-8?B?YUZNNzNXUjhSS25oNURBQnYxOTBpMmxFWjB1Ulo3bGppU1hzL213ZWtGZDE1?=
 =?utf-8?B?NlNFNWJoZTg2enpjREJkUVNSSnU3Ty90TWRXYmEwVHdPQkpERVhsYzRFVjNr?=
 =?utf-8?B?RlRrY2dCNlJKK0xQZGxoT2sreEdKQXB6ZXBLckpNRDBWSXZtb3pJcjNjZFBu?=
 =?utf-8?B?bnZiOE8rdGl0QTlNdkhhay91UUk0WTRWalg4UzAyN21vNGwwZUJpQjRMR1lE?=
 =?utf-8?B?T0NuK0NOS0ZBb2FFVnBldGRLQXZEOXFsaFYrc1lhSUtmeXY0SGdnaVM5TURo?=
 =?utf-8?B?cEF3NC8rR011TU5DSEsxNWVBS3BUbjdIczJ1RThqdUJaSkZHejRpQUFnZ2tR?=
 =?utf-8?B?dGh1eDVkTEgxQjNlaXBNangvVHB3PT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2e2575-3d4c-43c0-c2f4-08dc5a073756
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 09:10:21.9177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMql0NGCs4SqTcnnf/ch6FsSwZFj4y27g2vHpbuv6oG3ykD1jgr9CHiwFpZZ/+wTlEhYqh+fqJvE7NbaUD3tpEjnQMpj2ENKQWJcJgLoRYCQTzQ3gvv5WGW4Z+m7jT1P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9382

SGVsbG8gTWFuaXZhbm5hbiwNCg0KPiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6
IFRodXJzZGF5LCBBcHJpbCAxMSwgMjAyNCAyOjUyIEFNDQo+IA0KPiBPbiBXZWQsIEFwciAxMCwg
MjAyNCBhdCAwOTo0ODozMUFNICswOTAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiBU
aGlzIGRyaXZlciBwcmV2aW91c2x5IHN1cHBvcnRlZCByOGE3NzlmMCAoUi1DYXIgUzQtOCkuIEFk
ZCBzdXBwb3J0DQo+ID4gZm9yIHI4YTc3OWcwIChSLUNhciBWNEgpLg0KPiA+DQo+ID4gVG8gc3Vw
cG9ydCByOGE3NzlnMCwgaXQgcmVxdWlyZXMgc3BlY2lmaWMgZmlybXdhcmUuDQo+ID4NCj4gDQo+
IEFkZCBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBuZXcgU29DLiBMaWtlIGZlYXR1cmVzLCB3
aHkgZmlybXdhcmUgaXMgbmVlZGVkLA0KPiBob3cgaXQgaXMgZG93bmxvYWRlZC92ZXJpZmllZCBl
dGMuLi4NCg0KSSBnb3QgaXQuIEknbGwgYWRkIHN1Y2ggZGVzY3JpcHRpb25zLg0KDQo+ID4gU2ln
bmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXJj
YXItZ2VuNC5jIHwgMjAxICsrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcmNhci1nZW40LmMgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXJjYXItZ2VuNC5jDQo+ID4gaW5kZXggNDdlYzM5NDg4NWY1
Li5hNjI4MDQ2NzRmNGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1yY2FyLWdlbjQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtcmNhci1nZW40LmMNCj4gPiBAQCAtNSw4ICs1LDEwIEBADQo+ID4gICAqLw0KPiA+DQo+
ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZmlybXdh
cmUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvcGNpLmg+DQo+ID4gQEAgLTIwLDkgKzIyLDEwIEBADQo+ID4gIC8qIFJlbmVz
YXMtc3BlY2lmaWMgKi8NCj4gPiAgLyogUENJZSBNb2RlIFNldHRpbmcgUmVnaXN0ZXIgMCAqLw0K
PiA+ICAjZGVmaW5lIFBDSUVNU1IwCQkweDAwMDANCj4gPiAtI2RlZmluZSBCSUZVUl9NT0RfU0VU
X09OCUJJVCgwKQ0KPiA+ICsjZGVmaW5lIEFQUF9TUklTX01PREUJCUJJVCg2KQ0KPiA+ICAjZGVm
aW5lIERFVklDRV9UWVBFX0VQCQkwDQo+ID4gICNkZWZpbmUgREVWSUNFX1RZUEVfUkMJCUJJVCg0
KQ0KPiA+ICsjZGVmaW5lIEJJRlVSX01PRF9TRVRfT04JQklUKDApDQo+ID4NCj4gPiAgLyogUENJ
ZSBJbnRlcnJ1cHQgU3RhdHVzIDAgKi8NCj4gPiAgI2RlZmluZSBQQ0lFSU5UU1RTMAkJMHgwMDg0
DQo+ID4gQEAgLTM3LDE5ICs0MCw0NyBAQA0KPiA+ICAjZGVmaW5lIFBDSUVETUFJTlRTVFNFTgkJ
MHgwMzE0DQo+ID4gICNkZWZpbmUgUENJRURNQUlOVFNUU0VOX0lOSVQJR0VOTUFTSygxNSwgMCkN
Cj4gPg0KPiA+ICsvKiBQb3J0IExvZ2ljIFJlZ2lzdGVycyA4OSAqLw0KPiA+ICsjZGVmaW5lIFBS
VExHQzg5CQkweDBiNzANCj4gPiArDQo+ID4gKy8qIFBvcnQgTG9naWMgUmVnaXN0ZXJzIDkwICov
DQo+ID4gKyNkZWZpbmUgUFJUTEdDOTAJCTB4MGI3NA0KPiA+ICsNCj4gPiAgLyogUENJZSBSZXNl
dCBDb250cm9sIFJlZ2lzdGVyIDEgKi8NCj4gPiAgI2RlZmluZSBQQ0lFUlNUQ1RSTDEJCTB4MDAx
NA0KPiA+ICAjZGVmaW5lIEFQUF9IT0xEX1BIWV9SU1QJQklUKDE2KQ0KPiA+ICAjZGVmaW5lIEFQ
UF9MVFNTTV9FTkFCTEUJQklUKDApDQo+ID4NCj4gPiArLyogUENJZSBQb3dlciBNYW5hZ2VtZW50
IENvbnRyb2wgKi8NCj4gPiArI2RlZmluZSBQQ0lFUFdSTU5HQ1RSTAkJMHgwMDcwDQo+ID4gKyNk
ZWZpbmUgQVBQX0NMS19SRVFfTgkJQklUKDExKQ0KPiA+ICsjZGVmaW5lIEFQUF9DTEtfUE1fRU4J
CUJJVCgxMCkNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIFRoZSBSLUNhciBHZW40IGRvY3VtZW50
cyBkb24ndCBkZXNjcmliZSB0aGUgUEhZIHJlZ2lzdGVycycgbmFtZS4NCj4gPiArICogQnV0LCB0
aGUgaW5pdGlhbGl6YXRpb24gcHJvY2VkdXJlIGRlc2NyaWJlcyB0aGVzZSBvZmZzZXRzLiBTbywN
Cj4gPiArICogdGhpcyBkcml2ZXIgbWFrZXMgdXAgb3duICNkZWZpbmVzIGZvciB0aGUgb2Zmc2V0
cy4NCj4gPiArICovDQo+IA0KPiBUaGlzIHByb3ZpZGVzIG5vIGluZm9ybWF0aW9uIGF0IGFsbC4g
U28gYmV0dGVyIGhhcmRjb2RlIHRoZW0uDQoNCkhtbSwgQmpvcm4gc3VnZ2VzdGVkIHRoaXMgaW5z
dGVhZCBvZiBoYXJkY29kZToNCi0tLQ0KTWFrZSB1cCB5b3VyIG93biAjZGVmaW5lcyBmb3IgdGhl
IG9mZnNldHMuICBUaGF0IHdvdWxkIGJlIGJldHRlciB0aGFuDQptYWdpYyBoZXggb2Zmc2V0cyBi
ZWxvdy4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDI0MDMyNjIwNDg0Mi5H
QTE0OTM4OTBAYmhlbGdhYXMvDQotLS0NCg0KSSBkb24ndCBoYXZlIGFueSBwcmVmZXJlbmNlIGFi
b3V0IHRoZSBkZWZpbmVzIGFuZCBoYXJkY29kZWQuDQoNCj4gPiArI2RlZmluZSBSQ0FSX0dFTjRf
UENJRV9QSFlfMGY4CTB4MGY4DQo+ID4gKyNkZWZpbmUgUkNBUl9HRU40X1BDSUVfUEhZXzE0OAkw
eDE0OA0KPiA+ICsjZGVmaW5lIFJDQVJfR0VONF9QQ0lFX1BIWV8xZDQJMHgxZDQNCj4gPiArI2Rl
ZmluZSBSQ0FSX0dFTjRfUENJRV9QSFlfNTE0CTB4NTE0DQo+ID4gKyNkZWZpbmUgUkNBUl9HRU40
X1BDSUVfUEhZXzcwMAkweDcwMA0KPiA+ICsNCj4gPiAgI2RlZmluZSBSQ0FSX05VTV9TUEVFRF9D
SEFOR0VfUkVUUklFUwkxMA0KPiA+ICAjZGVmaW5lIFJDQVJfTUFYX0xJTktfU1BFRUQJCTQNCj4g
Pg0KPiA+ICAjZGVmaW5lIFJDQVJfR0VONF9QQ0lFX0VQX0ZVTkNfREJJX09GRlNFVAkweDEwMDAN
Cj4gPiAgI2RlZmluZSBSQ0FSX0dFTjRfUENJRV9FUF9GVU5DX0RCSTJfT0ZGU0VUCTB4ODAwDQo+
ID4NCj4gPiArI2RlZmluZSBSQ0FSX0dFTjRfUENJRV9GSVJNV0FSRV9OQU1FCQkicmNhcl9nZW40
X3BjaWUuYmluIg0KPiA+ICsjZGVmaW5lIFJDQVJfR0VONF9QQ0lFX0ZJUk1XQVJFX0JBU0VfQURE
UgkweGMwMDANCj4gPiArDQo+ID4gK01PRFVMRV9GSVJNV0FSRShSQ0FSX0dFTjRfUENJRV9GSVJN
V0FSRV9OQU1FKTsNCj4gPiArDQo+ID4gIHN0cnVjdCByY2FyX2dlbjRfcGNpZTsNCj4gPiAgc3Ry
dWN0IHJjYXJfZ2VuNF9wY2llX3BsYXRkYXRhIHsNCj4gPiArCXZvaWQgKCphZGRpdGlvbmFsX2Nv
bW1vbl9pbml0KShzdHJ1Y3QgcmNhcl9nZW40X3BjaWUgKnJjYXIpOw0KPiA+ICAJaW50ICgqbHRz
c21fZW5hYmxlKShzdHJ1Y3QgcmNhcl9nZW40X3BjaWUgKnJjYXIpOw0KPiA+ICAJZW51bSBkd19w
Y2llX2RldmljZV9tb2RlIG1vZGU7DQo+ID4gIH07DQo+ID4gQEAgLTU3LDEyICs4OCwxNDQgQEAg
c3RydWN0IHJjYXJfZ2VuNF9wY2llX3BsYXRkYXRhIHsNCj4gPiAgc3RydWN0IHJjYXJfZ2VuNF9w
Y2llIHsNCj4gPiAgCXN0cnVjdCBkd19wY2llIGR3Ow0KPiA+ICAJdm9pZCBfX2lvbWVtICpiYXNl
Ow0KPiA+ICsJdm9pZCBfX2lvbWVtICpwaHlfYmFzZTsNCj4gPiAgCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXY7DQo+ID4gIAljb25zdCBzdHJ1Y3QgcmNhcl9nZW40X3BjaWVfcGxhdGRhdGEg
KnBsYXRkYXRhOw0KPiA+ICB9Ow0KPiA+ICAjZGVmaW5lIHRvX3JjYXJfZ2VuNF9wY2llKF9kdykJ
Y29udGFpbmVyX29mKF9kdywgc3RydWN0IHJjYXJfZ2VuNF9wY2llLCBkdykNCj4gPg0KPiA+ICAv
KiBDb21tb24gKi8NCj4gPiArc3RhdGljIHZvaWQgcmNhcl9nZW40X3BjaWVfcGh5X3JlZ191cGRh
dGVfYml0cyhzdHJ1Y3QgcmNhcl9nZW40X3BjaWUgKnJjYXIsDQo+ID4gKwkJCQkJICAgICAgIHUz
MiBvZmZzZXQsIHUzMiBtYXNrLCB1MzIgdmFsKQ0KPiA+ICt7DQo+ID4gKwl1MzIgdG1wOw0KPiA+
ICsNCj4gPiArCXRtcCA9IHJlYWRsKHJjYXItPnBoeV9iYXNlICsgb2Zmc2V0KTsNCj4gPiArCXRt
cCAmPSB+bWFzazsNCj4gPiArCXRtcCB8PSB2YWw7DQo+ID4gKwl3cml0ZWwodG1wLCByY2FyLT5w
aHlfYmFzZSArIG9mZnNldCk7DQo+IA0KPiBJZiB5b3UgdXNlIEZJRUxEXyogbWFjcm9zLCB0aGVu
IHRoZSB2YWx1ZXMgY2FuIGJlIHBhc3NlZCBzZW5zaWJseSBpZS4sIGp1c3QgMA0KPiBhbmQgMS4N
Cg0KSSBnb3QgaXQuIEknbGwgdXNlIEZJRUxEXyogbWFjcm9zLg0KDQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyBpbnQgcmNhcl9nZW40X3BjaWVfcmVnX2NoZWNrX2JpdChzdHJ1Y3QgcmNhcl9n
ZW40X3BjaWUgKnJjYXIsDQo+IA0KPiByY2FyX2dlbjRfcGNpZV9yZWdfY2hlY2soKT8NCg0KSSds
bCByZW5hbWUgdGhlIGZ1bmN0aW9uLg0KDQo+ID4gKwkJCQkJdTMyIG9mZnNldCwgdTMyIG1hc2sp
DQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkd19wY2llICpkdyA9ICZyY2FyLT5kdzsNCj4gPiArDQo+
ID4gKwlpZiAoZHdfcGNpZV9yZWFkbF9kYmkoZHcsIG9mZnNldCkgJiBtYXNrKQ0KPiA+ICsJCXJl
dHVybiAtRUFHQUlOOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgaW50IHJjYXJfZ2VuNF9wY2llX3VwZGF0ZV9waHlfZmlybXdhcmUoc3RydWN0IHJj
YXJfZ2VuNF9wY2llICpyY2FyKQ0KPiA+ICt7DQo+ID4gKwljb25zdCB1MzIgY2hlY2tfYWRkcltd
ID0geyAweDAwMTAxMDE4LCAweDAwMTAxMTE4LCAweDAwMTAxMDIxLCAweDAwMTAxMTIxfTsNCj4g
DQo+IFdoYXQgYXJlIHRoZXNlIGFkZHJlc3Nlcz8NCg0KVGhlc2UgYXJlIGFsc28gaGFyZGNvZGVk
IGFkZHJlc3NlcyBvbiB0aGUgbWFudWFsLi4uDQoNCj4gPiArCXN0cnVjdCBkd19wY2llICpkdyA9
ICZyY2FyLT5kdzsNCj4gPiArCWNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZnc7DQo+ID4gKwl1bnNp
Z25lZCBpbnQgaSwgdGltZW91dDsNCj4gPiArCXUzMiBkYXRhOw0KPiA+ICsJaW50IHJldDsNCj4g
PiArDQo+ID4gKwlyZXQgPSByZXF1ZXN0X2Zpcm13YXJlKCZmdywgUkNBUl9HRU40X1BDSUVfRklS
TVdBUkVfTkFNRSwgZHctPmRldik7DQo+IA0KPiBJcyB0aGlzIHRoZSBQSFkgZmlybXdhcmUgb3Ig
UENJZT8NCg0KVGhlIFBIWSBmaXJtd2FyZS4NCg0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRl
dl9lcnIoZHctPmRldiwgIiVzOiBSZXF1ZXN0aW5nIGZpcm13YXJlIGZhaWxlZFxuIiwgX19mdW5j
X18pOw0KPiANCj4gUGxlYXNlLCBkbyBub3QgcHJpbnQgZnVuY3Rpb24gbmFtZXMgaW4gZXJyb3Ig
bG9nLg0KDQpCam9ybiBzdWdnZXN0ZWQgdGhpczoNCi0tLQ0KSXQgbG9va3MgbGlrZSBhIGZhaWx1
cmUgaGVyZSBsZWFkcyB0byBhIHByb2JlIGZhaWx1cmUsIHNvIEkgdGhpbmsgdGhpcw0KbmVlZHMg
YSBkaWFnbm9zdGljIG1lc3NhZ2Ugc28gdGhlIHVzZXIgaGFzIGEgaGludCBhYm91dCB3aGF0IHdl
bnQNCndyb25nLg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMjQwMzI2MjA0
ODQyLkdBMTQ5Mzg5MEBiaGVsZ2Fhcy8NCi0tLQ0KDQpJIGRvbid0IGhhdmUgYW55IHByZWZlcmVu
Y2UgYWJvdXQgd2l0aCBvciB3aXRob3V0IGVycm9yIGxvZyBoZXJlLg0KDQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgKGZ3LT5zaXplIC8g
Mik7IGkrKykgew0KPiA+ICsJCWRhdGEgPSBmdy0+ZGF0YVtpICogMl0gfCBmdy0+ZGF0YVsoaSAq
IDIpICsgMV0gPDwgODsNCj4gDQo+IFdlbGwsIHRoZSB1c3VhbCBjb25jYXQgb3JkZXIgaXM6DQo+
IA0KPiAJCWRhdGEgPDwgOCB8IGRhdGENCg0KSSBnb3QgaXQuIEknbGwgZml4IGl0Lg0KDQo+ID4g
KwkJdGltZW91dCA9IDEwMDsNCj4gPiArCQlkbyB7DQo+ID4gKwkJCWR3X3BjaWVfd3JpdGVsX2Ri
aShkdywgUFJUTEdDODksIFJDQVJfR0VONF9QQ0lFX0ZJUk1XQVJFX0JBU0VfQUREUiArIGkpOw0K
PiA+ICsJCQlkd19wY2llX3dyaXRlbF9kYmkoZHcsIFBSVExHQzkwLCBkYXRhKTsNCj4gPiArCQkJ
aWYgKHJjYXJfZ2VuNF9wY2llX3JlZ19jaGVja19iaXQocmNhciwgUFJUTEdDODksIEJJVCgzMCkp
ID49IDApDQo+IA0KPiBXaGF0IGlzIGdvaW5nIG9uIGhlcmU/IFBsZWFzZSBhZGQgYSBjb21tZW50
IHRvIG1ha2UgaXQgY2xlYXIuDQoNClVuZm9ydHVuYXRlbHksIHRoZSBtYW51YWwgZGVzY3JpYmVz
IGEgZmxvd2NoYXJ0IG9ubHkuDQoNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsJCQlpZiAoISgtLXRp
bWVvdXQpKSB7DQo+ID4gKwkJCQlyZXQgPSAtRVRJTUVET1VUOw0KPiA+ICsJCQkJZ290byBleGl0
Ow0KPiA+ICsJCQl9DQo+ID4gKwkJCXVzbGVlcF9yYW5nZSgxMDAsIDIwMCk7DQo+ID4gKwkJfSB3
aGlsZSAoMSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmNhcl9nZW40X3BjaWVfcGh5X3JlZ191
cGRhdGVfYml0cyhyY2FyLCBSQ0FSX0dFTjRfUENJRV9QSFlfMGY4LCBCSVQoMTcpLCBCSVQoMTcp
KTsNCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShjaGVja19hZGRyKTsg
aSsrKSB7DQo+ID4gKwkJdGltZW91dCA9IDEwMDsNCj4gPiArCQlkbyB7DQo+ID4gKwkJCWR3X3Bj
aWVfd3JpdGVsX2RiaShkdywgUFJUTEdDODksIGNoZWNrX2FkZHJbaV0pOw0KPiA+ICsJCQlyZXQg
PSByY2FyX2dlbjRfcGNpZV9yZWdfY2hlY2tfYml0KHJjYXIsIFBSVExHQzg5LCBCSVQoMzApKTsN
Cj4gPiArCQkJcmV0IHw9IHJjYXJfZ2VuNF9wY2llX3JlZ19jaGVja19iaXQocmNhciwgUFJUTEdD
OTAsIEJJVCgwKSk7DQo+ID4gKwkJCWlmIChyZXQgPj0gMCkNCj4gPiArCQkJCWJyZWFrOw0KPiA+
ICsJCQlpZiAoISgtLXRpbWVvdXQpKSB7DQo+ID4gKwkJCQlyZXQgPSAtRVRJTUVET1VUOw0KPiA+
ICsJCQkJZ290byBleGl0Ow0KPiA+ICsJCQl9DQo+ID4gKwkJCXVzbGVlcF9yYW5nZSgxMDAsIDIw
MCk7DQo+ID4gKwkJfSB3aGlsZSAoMSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gMDsN
Cj4gDQo+IHJldHVybiAwDQoNCklJVUMsIGNhbGxpbmcgcmVsZWFzZV9maXJtd2FyZShmdykgaXMg
cmVxdWlyZWQgaGVyZS4NCg0KPiA+ICtleGl0Og0KPiA+ICsJcmVsZWFzZV9maXJtd2FyZShmdyk7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCByY2FyX2dlbjRfcGNpZV9lbmFibGVfcGh5KHN0cnVjdCByY2FyX2dlbjRfcGNpZSAqcmNhcikN
Cj4gPiArew0KPiA+ICsJc3RydWN0IGR3X3BjaWUgKmR3ID0gJnJjYXItPmR3Ow0KPiA+ICsJdTMy
IHZhbDsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJdmFsID0gZHdfcGNpZV9yZWFkbF9k
YmkoZHcsIFBDSUVfUE9SVF9GT1JDRSk7DQo+ID4gKwl2YWwgfD0gUE9SVF9GT1JDRV9ET19ERVNL
RVdfRk9SX1NSSVM7DQo+ID4gKwlkd19wY2llX3dyaXRlbF9kYmkoZHcsIFBDSUVfUE9SVF9GT1JD
RSwgdmFsKTsNCj4gPiArDQo+ID4gKwl2YWwgPSByZWFkbChyY2FyLT5iYXNlICsgUENJRU1TUjAp
Ow0KPiA+ICsJdmFsIHw9IEFQUF9TUklTX01PREU7DQo+ID4gKwl3cml0ZWwodmFsLCByY2FyLT5i
YXNlICsgUENJRU1TUjApOw0KPiA+ICsNCj4gPiArCXJjYXJfZ2VuNF9wY2llX3BoeV9yZWdfdXBk
YXRlX2JpdHMocmNhciwgUkNBUl9HRU40X1BDSUVfUEhZXzcwMCwgQklUKDI4KSwgMCk7DQo+ID4g
KwlyY2FyX2dlbjRfcGNpZV9waHlfcmVnX3VwZGF0ZV9iaXRzKHJjYXIsIFJDQVJfR0VONF9QQ0lF
X1BIWV83MDAsIEJJVCgyMCksIDApOw0KPiA+ICsJcmNhcl9nZW40X3BjaWVfcGh5X3JlZ191cGRh
dGVfYml0cyhyY2FyLCBSQ0FSX0dFTjRfUENJRV9QSFlfNzAwLCBCSVQoMTIpLCAwKTsNCj4gPiAr
CXJjYXJfZ2VuNF9wY2llX3BoeV9yZWdfdXBkYXRlX2JpdHMocmNhciwgUkNBUl9HRU40X1BDSUVf
UEhZXzcwMCwgQklUKDQpLCAwKTsNCj4gPiArDQo+ID4gKwlyY2FyX2dlbjRfcGNpZV9waHlfcmVn
X3VwZGF0ZV9iaXRzKHJjYXIsIFJDQVJfR0VONF9QQ0lFX1BIWV8xNDgsDQo+ID4gKwkJCQkJICAg
R0VOTUFTSygyMywgMjIpLCBCSVQoMjIpKTsNCj4gPiArCXJjYXJfZ2VuNF9wY2llX3BoeV9yZWdf
dXBkYXRlX2JpdHMocmNhciwgUkNBUl9HRU40X1BDSUVfUEhZXzE0OCwNCj4gPiArCQkJCQkgICBH
RU5NQVNLKDE4LCAxNiksIEdFTk1BU0soMTcsIDE2KSk7DQo+ID4gKwlyY2FyX2dlbjRfcGNpZV9w
aHlfcmVnX3VwZGF0ZV9iaXRzKHJjYXIsIFJDQVJfR0VONF9QQ0lFX1BIWV8xNDgsDQo+ID4gKwkJ
CQkJICAgR0VOTUFTSyg3LCA2KSwgQklUKDYpKTsNCj4gPiArCXJjYXJfZ2VuNF9wY2llX3BoeV9y
ZWdfdXBkYXRlX2JpdHMocmNhciwgUkNBUl9HRU40X1BDSUVfUEhZXzE0OCwNCj4gPiArCQkJCQkg
ICBHRU5NQVNLKDIsIDApLCBHRU5NQVNLKDExLCAwKSk7DQo+ID4gKwlyY2FyX2dlbjRfcGNpZV9w
aHlfcmVnX3VwZGF0ZV9iaXRzKHJjYXIsIFJDQVJfR0VONF9QQ0lFX1BIWV8xZDQsDQo+ID4gKwkJ
CQkJICAgR0VOTUFTSygxNiwgMTUpLCBHRU5NQVNLKDE2LCAxNSkpOw0KPiA+ICsJcmNhcl9nZW40
X3BjaWVfcGh5X3JlZ191cGRhdGVfYml0cyhyY2FyLCBSQ0FSX0dFTjRfUENJRV9QSFlfNTE0LCBC
SVQoMjYpLCBCSVQoMjYpKTsNCj4gPiArCXJjYXJfZ2VuNF9wY2llX3BoeV9yZWdfdXBkYXRlX2Jp
dHMocmNhciwgUkNBUl9HRU40X1BDSUVfUEhZXzBmOCwgQklUKDE2KSwgMCk7DQo+ID4gKwlyY2Fy
X2dlbjRfcGNpZV9waHlfcmVnX3VwZGF0ZV9iaXRzKHJjYXIsIFJDQVJfR0VONF9QQ0lFX1BIWV8w
ZjgsIEJJVCgxOSksIEJJVCgxOSkpOw0KPiA+ICsNCj4gPiArCXZhbCA9IHJlYWRsKHJjYXItPmJh
c2UgKyBQQ0lFUlNUQ1RSTDEpOw0KPiA+ICsJdmFsICY9IH5BUFBfSE9MRF9QSFlfUlNUOw0KPiA+
ICsJd3JpdGVsKHZhbCwgcmNhci0+YmFzZSArIFBDSUVSU1RDVFJMMSk7DQo+ID4gKw0KPiA+ICsJ
cmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0KHJjYXItPnBoeV9iYXNlICsgUkNBUl9HRU40X1BDSUVf
UEhZXzBmOCwgdmFsLA0KPiA+ICsJCQkJICEodmFsICYgQklUKDE4KSksIDEwMCwgMTAwMDApOw0K
PiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlyZXQg
PSByY2FyX2dlbjRfcGNpZV91cGRhdGVfcGh5X2Zpcm13YXJlKHJjYXIpOw0KPiANCj4gVXBkYXRp
bmcgb3IgZG93bmxvYWRpbmcgdGhlIFBIWSBmaXJtd2FyZT8NCg0KSSB0aGluayBkb3dubG9hZGlu
ZyB0aGUgUEhZIGZpcm13YXJlIGlzIGJldHRlci4gU28sIEknbGwgcmVuYW1lIHRoZSBmdW5jdGlv
bi4NCg0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCXZh
bCA9IHJlYWRsKHJjYXItPmJhc2UgKyBQQ0lFUlNUQ1RSTDEpOw0KPiA+ICsJdmFsIHw9IEFQUF9M
VFNTTV9FTkFCTEU7DQo+ID4gKwl3cml0ZWwodmFsLCByY2FyLT5iYXNlICsgUENJRVJTVENUUkwx
KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZv
aWQgcmNhcl9nZW40X3BjaWVfbHRzc21fY29udHJvbChzdHJ1Y3QgcmNhcl9nZW40X3BjaWUgKnJj
YXIsDQo+ID4gIAkJCQkJIGJvb2wgZW5hYmxlKQ0KPiA+ICB7DQo+ID4gQEAgLTIwMCw2ICszNjMs
OSBAQCBzdGF0aWMgaW50IHJjYXJfZ2VuNF9wY2llX2NvbW1vbl9pbml0KHN0cnVjdCByY2FyX2dl
bjRfcGNpZSAqcmNhcikNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJZ290byBlcnJfdW5wcmVwYXJl
Ow0KPiA+DQo+ID4gKwlpZiAocmNhci0+cGxhdGRhdGEtPmFkZGl0aW9uYWxfY29tbW9uX2luaXQp
DQo+ID4gKwkJcmNhci0+cGxhdGRhdGEtPmFkZGl0aW9uYWxfY29tbW9uX2luaXQocmNhcik7DQo+
ID4gKw0KPiA+ICAJcmV0dXJuIDA7DQo+ID4NCj4gPiAgZXJyX3VucHJlcGFyZToNCj4gPiBAQCAt
MjQxLDYgKzQwNywxMCBAQCBzdGF0aWMgdm9pZCByY2FyX2dlbjRfcGNpZV91bnByZXBhcmUoc3Ry
dWN0IHJjYXJfZ2VuNF9wY2llICpyY2FyKQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgcmNhcl9nZW40
X3BjaWVfZ2V0X3Jlc291cmNlcyhzdHJ1Y3QgcmNhcl9nZW40X3BjaWUgKnJjYXIpDQo+ID4gIHsN
Cj4gPiArCXJjYXItPnBoeV9iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5
bmFtZShyY2FyLT5wZGV2LCAicGh5Iik7DQo+ID4gKwlpZiAoSVNfRVJSKHJjYXItPnBoeV9iYXNl
KSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihyY2FyLT5iYXNlKTsNCj4gDQo+IHJjYXItPnBoeV9i
YXNlPw0KDQpPb3BzLiBJJ2xsIGZpeCBpdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNo
aW1vZGENCg0KPiAtIE1hbmkNCj4gDQo+IC0tDQo+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCv
jSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==

