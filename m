Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5226C1A90B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 04:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392785AbgDOCAO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 22:00:14 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:37920
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387766AbgDOCAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 22:00:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJF+4axQ3p25WNc9azufmlpUXd1y6nU/Wkv5lRQHf8TWHh+A5+1a+LGU6k3Q7D30NzlSNSaBJBl4EMNLc0Riz/W32fhQWHvOlfOukKzy9vv3rRv5N/JTM2I33YbGs3WAPVXCxlNnYsYIobekErAJfvqSb5Qzq/js1YwVxQYH5ZQdLzIFWfKoEwAK0/174kPq3WYRmAYuoM2eaw+VsTkcNJZr2vWuWDsd0tXCP3m9bKD7bo8X7wISqsPMuH9pG8yaHsta23/Hhm+MoCsZZ70UJE0RQusbEZa50j7VRqkqDvXcpRgumCXAnbyLnDQHcUfVLmB1aP/QUscAMx3DnPCXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW84VRQHUm8XVO+2rLPV9WEuX3gDX+ExJuC6NsIs+Zs=;
 b=VLsj5Cp5zmUokhNc3Q4ScOyJuBaGhAJX+4O873xplFMi3qV92wzT0Zfz37xO3GDB9uHyM4UUl5EuX1v65v1k4btRMJIaxc19lPb+6RteirKyl2Lc8ObBLsNtpgBZ9wx8JyQDecPAIVGBs7oTQ3z5arHmJa1ORzFXHT02akezEV4ErZ/OpP+jfNtVAWvl7JHRId1FH+HL6+zBPggpo/HCdrCrh7hA6q0WRtM93NOtlc8rgQ/x/d+Z1iualkGPDWuPKsd3fC1SY7eLmVGjFsuKL/t0Ego2PKnOX61SWrpc/+IKrJj3fNYWL1TeMm3U74Q5NOmZubeDQ0kT3uydcPUr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW84VRQHUm8XVO+2rLPV9WEuX3gDX+ExJuC6NsIs+Zs=;
 b=gSC5ttgwmoBE9HoTMbPsWPK8MEMYmxJYVgc8W3SuiQYSjVgKoUBmVO/DgylTNCoVCU34gZP2LTomtk3ASTRkXKoZ+m1kJg6IAX7lWJJiot6HRgCOXG3zbEhhcnR/OWHGDd3LauEjCo7CiaZpfdk6QHUGDi9vCtr8WB3xbvf7mB8=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3520.jpnprd01.prod.outlook.com (20.178.137.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15; Wed, 15 Apr 2020 02:00:08 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 02:00:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] dt-bndings: iommu: renesas, ipmmu-vmsa: convert to
 json-schema
Thread-Topic: [PATCH] dt-bndings: iommu: renesas, ipmmu-vmsa: convert to
 json-schema
Thread-Index: AQHWEoBV45dVUwCDv0GH/0iVUxi6YKh5bfPg
Date:   Wed, 15 Apr 2020 02:00:08 +0000
Message-ID: <TYAPR01MB454430982D630B6B7973C11BD8DB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <fef59497-e5ef-bfe4-e845-389fd623783b@arm.com>
In-Reply-To: <fef59497-e5ef-bfe4-e845-389fd623783b@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35be0a30-2028-4419-6a7e-08d7e0e0b98d
x-ms-traffictypediagnostic: TYAPR01MB3520:
x-microsoft-antispam-prvs: <TYAPR01MB352049823309AE4A7949DDB6D8DB0@TYAPR01MB3520.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(6506007)(53546011)(478600001)(9686003)(7696005)(110136005)(316002)(55016002)(2906002)(55236004)(4326008)(5660300002)(71200400001)(186003)(76116006)(33656002)(52536014)(66446008)(8936002)(66556008)(66946007)(64756008)(86362001)(66476007)(4744005)(54906003)(26005)(8676002)(81156014);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ttBIFz3kQMH8dB6SMg4SgzcZRj0057kIYtsgVHPsD2n0Jgzdz57GYKKo3PozhV5lcuP9rQRj/f1OnftIpy4UZ+LLI962QVn+byFmVcyBPmQwX1eA/s08TDq8Jdbbd+KIJdODKKeFTx3tSr6VLcqya9Put4ZHPLjvw0clVcrp7mIhrBuNvJ76XflvD8i7PUYPlUWPGMudReAojR7PlDd3LCZ0UuSZIJo1pH+Ohy6bbPxuCSwnCfAnUuicoNX+vVkKB8+Y2x1dnBHClWwOMz6zMwvY3Z283TaiP+i4Xis8WoYDOB38uG4dgJKGdEN3vS0umqGYrqKYKEeyTZNvM0PGInRm5Vkr+ZLlOZNYAeb4HMfJI8tyfvSzbVa85z1eHMrTlKNTk5BxIsuUWSY8bU7U1wFvTuO2oavHQ/j3VdcQ1Rwsr47DidUmWzpO+8bh7Faa
x-ms-exchange-antispam-messagedata: aqCgtKSbn94lR9PqGk+C/ASj2sBDswoH2ZqGWKLKeCdW8nUltGbxgM0Nl1MnHf/6pTYwj1l2jBAcOzfXq+RGaUTug3AuNPPsyzGmBY2R2c4EUGyf1ZbvXoVcL4ACy41FzDglrzIV0eOl9aQZ/5C8Ng==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35be0a30-2028-4419-6a7e-08d7e0e0b98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 02:00:08.5723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgLfysfL2PxvfDKC2itExWo40yPlLApEbJoj4ROxyur7lzaot8GzL7XJ9hHGQX6EXvVb0KMBIimoZcW5DhvP8Vvm78dbb0AaX+UdpzBMEfDL2CbiC3HubVSL3mFtHYwe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3520
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDE1LCAyMDIwIDI6MTYgQU0NCj4gDQo+IE9uIDIwMjAtMDQtMTMgMTE6MjUgYW0sIFlvc2hpaGly
byBTaGltb2RhIHdyb3RlOg0KPiBbLi4uXQ0KPiA+IC1FYWNoIGJ1cyBtYXN0ZXIgY29ubmVjdGVk
IHRvIGFuIElQTU1VIG11c3QgcmVmZXJlbmNlIHRoZSBJUE1NVSBpbiBpdHMgZGV2aWNlDQo+ID4g
LW5vZGUgd2l0aCB0aGUgZm9sbG93aW5nIHByb3BlcnR5Og0KPiA+IC0NCj4gPiAtICAtIGlvbW11
czogQSByZWZlcmVuY2UgdG8gdGhlIElQTU1VIGluIHR3byBjZWxscy4gVGhlIGZpcnN0IGNlbGwg
aXMgYSBwaGFuZGxlDQo+ID4gLSAgICB0byB0aGUgSVBNTVUgYW5kIHRoZSBzZWNvbmQgY2VsbCB0
aGUgbnVtYmVyIG9mIHRoZSBtaWNyby1UTEIgdGhhdCB0aGUNCj4gPiAtICAgIGRldmljZSBpcyBj
b25uZWN0ZWQgdG8uDQo+IA0KPiBUaGlzIGRlZmluaXRpb24gb2Ygd2hhdCB0aGUgcGhhbmRsZSBh
cmd1bWVudCBtZWFucy4uLg0KPiANCj4gWy4uLl0NCj4gPiArICAnI2lvbW11LWNlbGxzJzoNCj4g
PiArICAgIGNvbnN0OiAxDQo+ICA+ICsNCj4gDQo+IC4uLmRlc2VydmVzIHRvIGJlIGNhcHR1cmVk
IGluIGEgZGVzY3JpcHRpb24gaGVyZS4NCg0KVGhhbmsgeW91IGZvciB0aGUgY29tbWVudCEgSSds
bCBmaXggdGhpcy4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBSb2Jp
bi4NCg==
