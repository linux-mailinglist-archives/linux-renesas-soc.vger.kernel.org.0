Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99A64FEC31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 03:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiDMB0p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 21:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiDMB0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 21:26:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252A62A243;
        Tue, 12 Apr 2022 18:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfeF0VYC6W0ddqQ4LvQMZRf1HhcQNLpe6YJNGmWXjgtCD77In3rhU1V426gaDsWniQAE/eOFG7GKShTZ4coM01Xg0U9IcwGq8H+PDpCsJe1opu6a1TLRq8UyPiixYoi4NxZIuhOWUgLHFrLnjykvC8evYAnQ9noX5kJQtySA5GuH+uLhyh0UqwC5onxlRqL9E/TX+qKdm6P78bcAhSdZwALbTjoyoRVtOr+aI+6r8MXeG8jR3bbwEX5D/FowB64hmeZVTBq/q5q6+Wl9Ix94mHNDzF1g7UhRQZdU9YnCwwt9mHneaflFI+A3st6L41xypEgPiv0Lb7u3cZDEPZFdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/y2iWbDEbPoa8C4nGUyFoOFTA4fL6+gXyHUKF0T6fk=;
 b=LizmhGFd4mEF/vVLSrfDU3RXTbXUy3x+nI5TGsEZeW6zODrB2hO+xNaGnhaaq5y2Orb7NGD84fcGsXybHxgUdcWwrx5ABjtRj62xYXtK+FmIsDCjHUN7Ro42xoeyLbszbgiBTmIbXFjr1AFzdosjR3X+WMzuJLaNulM6RLel+q2C59/akjh3S8H2xPoFJuAS5dD5UC9Gd4NMW5D+Z0ItVijMaKrDsxRWGKpxERme+vx6Hqh1WuTrBaDSY9bzMe6T8sogRSYouKlN1z8nYQBclv7NK3NuVpf6b68OvR3/qimPFPR05FsNgXhgQnabys+/YkKWi2gAqEKw94ZLSYOfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/y2iWbDEbPoa8C4nGUyFoOFTA4fL6+gXyHUKF0T6fk=;
 b=iFZNYPMb29188UFj7CNcAzp/pw0XwwkR/cYna7hHPoRqbO2f6EpRjwp2AoZBvuTI0sB6GbCLCly+91MQyRtndd2CzX5GpoZtpwYcegqM1wYHWZ4niymSuoxXLMVuM9T6G6h+louWbNvIYvbUL2p8B5qo9Nl+rs25ETpOdGVy+zA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB7471.jpnprd01.prod.outlook.com
 (2603:1096:604:145::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 13 Apr
 2022 01:24:20 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 01:24:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/7] scsi: ufs-renesas: Add support for Renesas R-Car UFS
 controller
Thread-Topic: [PATCH 4/7] scsi: ufs-renesas: Add support for Renesas R-Car UFS
 controller
Thread-Index: AQHYTkAdAYFcN0mSqkmg4iG+hj3/46zsNBiAgADZWxA=
Date:   Wed, 13 Apr 2022 01:24:20 +0000
Message-ID: <TYBPR01MB5341C5C105193692D3946496D8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-5-yoshihiro.shimoda.uh@renesas.com>
 <69ae7c10-0967-7581-18df-8ec19e9aa410@linaro.org>
In-Reply-To: <69ae7c10-0967-7581-18df-8ec19e9aa410@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8346dd9e-0375-49f2-b1fe-08da1cec5603
x-ms-traffictypediagnostic: OSAPR01MB7471:EE_
x-microsoft-antispam-prvs: <OSAPR01MB74714F9ECB862CE94B5D2ED2D8EC9@OSAPR01MB7471.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hVLo1bCH0mvqYrBL9aaNY/Cz7SHua/gbWJ4cM4u9q+lrayAFzst2xcrksWdK2nMjHO4KSUQQW1L3jXkbIk45MIlRy6Y9ONSH6FgXNdM0oW+PKLh0qoiQQ06ZWiB0IAkwyDXbpiXLoNkmeUlM7w63gwDyTAvpqSCVsPeJVKNr5oVZpVHydMJhxOO1ugJW6bfMWpqN2pIAaq4NkROrkMQMIIVGTTXXz9WD3r3sXJm/M4QkZCKScM8LwSZAovQBSuCqw9PN5Upz+dbXHELoRqL7PrjbNIv0IN9WjHP/8UBOkAM0Tqmw0gaqGeqkY20zQ3Nmg9vbpiZ+bRLz5EsEyb1nxSqhixGCm1kDCQSq1n1KxQ+naDQu9vzJzRVgyZ9AptzfTrWe5jkZVJWzJDpvir21sTivM7tfGpqWULEAt6zwLTKepuUEY0R139/qEwi/uuBXCU+F2C+U5B4Tc5lWpu2Q4c3aSLywBac1fe44eXOSVxhTxijTD5iz0ZjDnWhvnwqnItmB0Y93RdqSoMlfPSGjLl1+5KYMU/uey1Tqg6jKiX27y5avax+hOEFdiF1KS2s/LL6TDW8rdDQpMw32uVEb41Flceo/FkEYrMxtnak4Vh+R0vmiTKceyZnDZKab79b4VxvrXuuOWtQ09DN4WCmKHTJtqL/fyokvmOYgEOELaMQuTKnqw5M2PFg4KeDBHNNJmFL/7HbWiMkJRe6w0pe+1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(508600001)(38100700002)(54906003)(71200400001)(110136005)(86362001)(76116006)(33656002)(66446008)(66946007)(64756008)(66556008)(8676002)(66476007)(4326008)(9686003)(55016003)(7696005)(122000001)(53546011)(2906002)(186003)(38070700005)(6506007)(5660300002)(7416002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmpVOXpobi94Qm5tbG9Jam9FNWMvYnB2Smx4cWpwMmdnd2w3b25MV3NVMkNZ?=
 =?utf-8?B?bGk2YlVvRzhudTN3MzFtWjhTQ2lNWDlkRmZlZ1NTenBQKy8yZ0pOREd5bXlI?=
 =?utf-8?B?QzQ1ZFhZbWVzZzEwVkFUWUt1NHY3M2dMZEdaMmo4MnhTTExFWU11YlIzN05G?=
 =?utf-8?B?QmdXTWpuT0NWdEFSWkVsYXBONEtsaEJRY1hTTnNZRWd6ZVpkMm5CKzIyaFFO?=
 =?utf-8?B?QXNDQjU3R1ZkUmRnZWMvWmtYb04reGZ4bndCRzFtbVZSa1Z4WXdZT2x3REdw?=
 =?utf-8?B?bmxjQ1pUTCtyKzEvR3VXYVFtS0lyQTAzMWEvZnBVWmVuU28xV1M5S3Q3VWZJ?=
 =?utf-8?B?R1d5RUV2NWttVFNiOXM5MStjQm5PcjlYUTBLbkF3dHUrQ0ZDRUJNaWJmRy9F?=
 =?utf-8?B?aFFzcEs0ZzhDNk81Mk1QbU5oQksvSkt0eFVJUGpYN3NNMWFDMGNQQmd2SUUw?=
 =?utf-8?B?REZYT1djd2VjTjQyaVNBbDNjYjBjRGtrcEhqeW1QUm5pVCtnUmxpZncxRE5X?=
 =?utf-8?B?b1ZkcFlVNWY3YXBCOHVucUxNQjFyNzZJTmdFcjgrbDBaVmpaMkFtS1dhV3dx?=
 =?utf-8?B?WlpuVVh0N2QzcUlJNlF4cnZkVHJKS3Rvd29TckNxWTI5V3U3cWZmcnJoTGt6?=
 =?utf-8?B?VHJpNGp5WnBnbm02L3p6SEJHRzltaUFsSDU5NnJYMHI4TTcyaWszWHhheVp1?=
 =?utf-8?B?T2FKMWNKTjhlY0tLdkVpMTJySzlLbGN1YWQ4UmRIYTd2R21vYUJ3aU9JeHV1?=
 =?utf-8?B?L1lXaEltbXIzSUxIdEhaMFI5NHlDanozbFVCRXN5aGs2bm05MDFPQmF6cFJk?=
 =?utf-8?B?aUR2VGZCMnQxbE1ablErdGYwQlQra2RZM0VySndINUNBZFh2UzYrTWlaZDA3?=
 =?utf-8?B?aER4bGpyZDRtRHgxbkhUT3hLV3JxNmM1aS9zR2JEaDNaNTlDcnp5V2xjYVQv?=
 =?utf-8?B?TlJVY0VPbnZMR0wxZkFkSVZxSk9oTjZLSmsxSHNoYm9NSW5HbW0rbTdMYnhD?=
 =?utf-8?B?SHJvSWwxSWtKY3lZeTFPdExoMlZUZkFQZG45UXlPU0xmVzlYa2QrZHA1Q1Mx?=
 =?utf-8?B?OE1UcTIzVTQxMDN2RERzaVBRQ0R3WTc0aUtQSURRVk5FMkpUdkN5ZE5pQWUx?=
 =?utf-8?B?Y0l1RTNXR0VIckIxeHEvQ0c0THIvRmRCK0xWSWtGbDhMR2ZsUUhqeUFtdS9E?=
 =?utf-8?B?NnVWV01tM3poNFI5blJHWnFQWTducWczdkV5Ym90QklmRDdYdmxEeGFRQ1Mz?=
 =?utf-8?B?Y0J1SlRXMmdrRmVmdzNwVThWd1VNbjhyb09ZRDZRVDFFY2ROc3UzS1F0ekVo?=
 =?utf-8?B?Q0tWN3gyL0x3K3U3NGtaT0RzTG1VWmZORUhvSFBmZFRUS016V0lteEcyUTgy?=
 =?utf-8?B?UVJ5RTRCTkF5M3Q3K1o0RW44ZzdzcU9xaGYzS1lTV0IrY0pZa0cza3hmNE1T?=
 =?utf-8?B?OE84Nld2cmJpcDhyNEVoc2xpNFNtWWhvaGVQUFIrZkVMOXB3cVZCQnRUZWt0?=
 =?utf-8?B?QVJsTU5UM0RtNUZXMkhwcWZDb1VuTmxvKzJveXkxUHA0bkw4ZW00WTMvdDl0?=
 =?utf-8?B?Z0F5R2krd0RWMFVZNlV0TEZYQ04vYXBrNko1cEJqdENWOHUvMktBRmdoMDRi?=
 =?utf-8?B?d2F2c2FGeWQ2aVBhUzFEMk0vK1k4TllwWmsrdUtFNThwQnN2eEN2Rm54SHBm?=
 =?utf-8?B?c21jakh4ekNib1B6TXJzd09sUjlWbTNlVnlpM1pmdDU4MTg2c3ZXVGlIOUoz?=
 =?utf-8?B?YWxtYmc4RWNwR3BwRjg1ZWJDYWhCc3ZEU1NoVmVlSTdQRU1GWTVxeWVyczQv?=
 =?utf-8?B?UFRVYVRleW5IZzZieHN6Sm5nU2NuVGE2U3pyMFFrcXl3YlZXVHp2amZwRUdS?=
 =?utf-8?B?blBZY3pWV0VDZ0d5ZUxzdFF2RUkzVmtnRysycDZWRDJoNHpIRVNSL21YZ1Rw?=
 =?utf-8?B?RS9CaXFDY2JhamJCUEZOQnc2ditHNWdBRHIxdVJHMS9kdkI2WkJ0dTI5bHFO?=
 =?utf-8?B?KzF3VE1aaFNPTEx3SndNeTJFVFBkekRRZnFSOHpBM2YyRUpZQWZJSmdCbFl5?=
 =?utf-8?B?WXlNUDlSL0lVTkE5RW9MR1ByM0QxdGtHSVlFcGI0cStpOG52Q2lReGNwcHZS?=
 =?utf-8?B?V3ZwaE9uSlRqOWFNUXFiMEc3eW5yRGF5bmpESEJoSGl2VUxVWXBDbzRBYnls?=
 =?utf-8?B?RTJwT0ltZytiM256Y0EvQnFiSXYraDl6dnZpNXdFMHFhYmZtVHo2N2RybGt5?=
 =?utf-8?B?WGF3UzR6TzRJRUdMZkJTcnVZWGtuS3B3YnhnWUhUVUpoZzhhSTRKdEE4eXJ1?=
 =?utf-8?B?ai90YTRPZURWT1Y0Y2tWNjdQcktBRXUxTUZRN21jTStzSytOV3BTem5DM251?=
 =?utf-8?Q?TYoSXVs2SsBYkQUbhZvmvFSGWtJ09JMaDHvASTh3Ugqu+?=
x-ms-exchange-antispam-messagedata-1: qkBpiGO3m28yGiMEccH1xsVPNnIyNRfUo/Y=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8346dd9e-0375-49f2-b1fe-08da1cec5603
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 01:24:20.6820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a90MLA2EaYxs54ugZfqzzATFw8ERXXpcXvRLULecofQSCfP1+P8mjSzdK/paJJEKLj8ZeTKBTRl+xaCfFtS9nXyo3OYbTxHB3RNgc2I6lsXcZRb6kWqGPU/aQtPFmY1z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7471
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2ksIFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDEyLCAyMDIyIDk6MjUgUE0N
Cj4gDQo+IE9uIDEyLzA0LzIwMjIgMDk6MzYsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+
IEFkZCBzdXBwb3J0IGZvciBSZW5lc2FzIFItQ2FyIFVGUyBjb250cm9sbGVyIHdoaWNoIG5lZWRz
IHZlbmRlciBzcGVjaWZpYw0KPiA+IGluaXRpYWxpemF0aW9uLg0KPiANCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLiBUaGVyZSBpcyBzb21ldGhpbmcgdG8gZGlzY3Vzcy9pbXByb3ZlLg0KPiAN
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdWZzX3JlbmVzYXNfb2ZfbWF0
Y2hbXSA9IHsNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3NzlmMC11ZnMiIH0s
DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHVmc19yZW5lc2FzX29mX21h
dGNoKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgdWZzX3JlbmVzYXNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsJcmV0dXJuIHVmc2hjZF9wbHRmcm1f
aW5pdChwZGV2LCAmdWZzX3JlbmVzYXNfdm9wcyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgdWZzX3JlbmVzYXNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCB1ZnNfaGJhICpoYmEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsNCj4gPiArDQo+ID4gKwl1ZnNoY2RfcmVtb3ZlKGhiYSk7DQo+ID4gKw0KPiA+ICsJcmV0
dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHVmc19yZW5lc2FzX3BsYXRmb3JtID0gew0KPiA+ICsJLnByb2JlCT0gdWZzX3JlbmVzYXNfcHJv
YmUsDQo+ID4gKwkucmVtb3ZlCT0gdWZzX3JlbmVzYXNfcmVtb3ZlLA0KPiA+ICsJLmRyaXZlcgk9
IHsNCj4gPiArCQkubmFtZQk9ICJ1ZnNoY2QtcmVuZXNhcyIsDQo+ID4gKwkJLm9mX21hdGNoX3Rh
YmxlCT0gb2ZfbWF0Y2hfcHRyKHVmc19yZW5lc2FzX29mX21hdGNoKSwNCj4gDQo+IFlvdSBwcm9i
YWJseSBuZWVkICJfX21heWJlX3VudXNlZCIgaWYgeW91IHdhbnQgdG8ga2VlcCBvZl9tYXRjaF9w
dHIuDQo+IENvbXBpbGUgdGVzdCB3aXRoIFc9MSBvbiBvdGhlciBwbGF0Zm9ybXMgc2hvdWxkIHBv
aW50IGl0IG91dC4gT3RoZXINCj4gc29sdXRpb24gaXMgdG8gcmVtb3ZlIG9mX21hdGNoX3B0cigp
Lg0KDQpJJ2xsIGFkZCBfX21heWJlX3VudXNlZC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJv
IFNoaW1vZGENCg0K
