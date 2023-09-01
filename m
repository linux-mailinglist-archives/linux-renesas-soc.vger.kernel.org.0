Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2939978F698
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 03:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343740AbjIABNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 21:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234566AbjIABNU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 21:13:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D4A95;
        Thu, 31 Aug 2023 18:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKQleXHhXJvK9GMNv1mY1nvrgsJGCTX5Pkhr30Owt22w6qEiDnOOmzprNnk0ZWnxViMdMzfnJisHXruW6XdkRNOqdqmJfxVxvhk/Z4w3mT7d/bCjeDbiocHU08vXfQL4pqdsBJxK33/5xCZXrllLbOqpEf5fJk0lmxBuc79FqRJas67l/4zTFjrt27el7T2G9cZdTsMrh4hDuIgqj4saiHYTPPJ7XlOVjZFs9nXQsHz8iFC4ru/U/cyTQ8R8kFAosPzAl02yMUFW3Dixm5UNTY2rdOcj7hPVuIcrlKLcA9q9RV1IbopU3jqnOE3HLtUfF5x+M6JULu2adEL4JvckqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d1oXa9VoLp9x3zpz8Bvwirie1RejHRRDhScrKqZhcA=;
 b=mXe5GKyx1WjL/T2ZAYvpJz9DTDvLWcZD7yC1OkbuLti4DNuX7sTLwN5B8vJAzUnLystmVjbl4+WzrTmr3WbJuJs6lro2XJZOkSf6k0+PlKPaOJIBrlczwTOY+KeQMPy5QxBeaykbPD4EBh6sneuLFpHOcYI7BqQovkcshmeut0GquXIh00LgvSfJbP7c9eFs/nZ6DXF+C00BfF8dcQq6sBUiiJaik4Z20ePDQXOGPsEEf345SeFSbW8aT7SPL9xcg5ADI9pfcSmWqGp6j0JJ/YF9r8DbJ6NmuJx0YTmph5U/I6kaaJlBn8fZFU/jZ0KN2gH1N3zI1XvUohWhRRuzwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d1oXa9VoLp9x3zpz8Bvwirie1RejHRRDhScrKqZhcA=;
 b=VLsg8AlsM306+0L8mmgglCIvsmwW6Ev9ftLdtf1TCqcIVp1DX++nDQ4e+x/aQP/zrz92EpOSwsB2y/Y2likw1iX4XtjdE5zKwNKDKhOQSZ439n02yMXcHfzI5AO1+ot8/j5hzpU9eG7RoWf+clPybHO+ttNHz/zIVN0PQe5/3IM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8646.jpnprd01.prod.outlook.com
 (2603:1096:604:188::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 01:13:10 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6745.022; Fri, 1 Sep 2023
 01:13:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kw@linux.com" <kw@linux.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "kishon@kernel.org" <kishon@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v20 14/19] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe
 Host
Thread-Topic: [PATCH v20 14/19] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe
 Host
Thread-Index: AQHZ1zcP5/8rtvT+bUaMT/cTYKYnlLAEazcAgADDIgA=
Date:   Fri, 1 Sep 2023 01:13:10 +0000
Message-ID: <TYBPR01MB53419A3F4A57489D3A9ACE6CD8E4A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230825093219.2685912-1-yoshihiro.shimoda.uh@renesas.com>
 <20230825093219.2685912-15-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV7Qxjs+84E_Ht=d2EvBMYwwPxviT-DaT4-2m4Ds_+tdw@mail.gmail.com>
In-Reply-To: <CAMuHMdV7Qxjs+84E_Ht=d2EvBMYwwPxviT-DaT4-2m4Ds_+tdw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8646:EE_
x-ms-office365-filtering-correlation-id: aa9f2b09-26e6-4c72-335e-08dbaa889b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gTU0um7hVz4qD2mgX5ueyT/1plMDHplXKoHxBq9haVcDO9+k/YWmP5Y3fJSr4DfM6PhJJEePls7RMgTj27sMMDiknODJP9lYRgQaZg4hMVq0nZC/yFCHTbVw0oLwDnpszpKevoEQJhCSFhAsMXmDvC6hls7DNRzXVEGlsOu9fhMv9SxDx5of/73cjKfiCnYxpaqeNaL9HNlVJ+RYtZ5IVbwpBuRbN56t+/TZG+cBgkYiFXwt7OdHoonne58KNMf/JhYoZRdm39Pi4r+Ignx1PGm9LBprQscje1N+qSc/73e1zCEis99WvuIDwVbp6wx1LF8+mfo/7g+F4Ea5uNF7DSSJEa/NsYoKkyjaPm5hBmPEvrjUD6UhA/lCTMrv2Q2WfUhksQ2A//EDMEez/SyDYKpOlbPJ2Y9GRy81Eyx/sejfL/7By4G5auMi3K20Q36eSUhmX9xsa0bNtNr0BA4lZ8eUsXalim79WClPNFXoA7GKc3SWh//0AqXL5JAdgVKpsOY8r8NJ7WuErmCmzgsUgWCqUz4whb9vgPqGNWfl1/OF8nyW6n5ZWmUFC20kH231YDuPF0eTqfpow/IXjhRxQkMC95SKoSyGWFFDVvhVNU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199024)(186009)(1800799009)(38100700002)(66556008)(38070700005)(54906003)(66476007)(64756008)(76116006)(66946007)(66446008)(9686003)(966005)(7416002)(122000001)(53546011)(83380400001)(316002)(6916009)(86362001)(7696005)(6506007)(2906002)(33656002)(41300700001)(478600001)(4326008)(8676002)(8936002)(71200400001)(5660300002)(52536014)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDlBOG12NTBvOU8zdmh5MTl0d01vOERXaFRqVjM4WGlZZURPZG1PdThuT0pz?=
 =?utf-8?B?ZTZ1ZjF0WlZBVm0vb0cvRU9LWDRhWUtHSW1yTzFOcGJvK2tLcFJpMmE3SExo?=
 =?utf-8?B?SEtKRlVVYmUxVXg1ZDFQa1Y5bk14SDFOSmdmYjZKcWFyazV3T1kvVzVTVTVa?=
 =?utf-8?B?OVdWY3hxVWhGL3NhYVUwZE5FMytNSlVCNFUyanY4aWhnUEo2QU51NXpaOHFv?=
 =?utf-8?B?WjVLZzh1L1hkdDhySGZQQktVUjBXeDlJMXNsU2JFREJWTWpGcmUyNmFjRnZM?=
 =?utf-8?B?ck1uNDdUemN2aXFhRXY0RGFwOEdXT2JGMmt1QTBVTXNTSW5BVUd1OU5wRUN6?=
 =?utf-8?B?MDlJSnpXMWdhZlBBdzc2OXVNc3M1NzRWMmVER1ZHc0NpOTRLUVdtdG9uUmtl?=
 =?utf-8?B?SzBDVDhxbXZrQ2ZwWExiMjE0L3RJTk9UcTdZcmoxdkZjWDM2L1FWSWxaQm1q?=
 =?utf-8?B?UnhQMEwwR3lwM3ljcEkxYnowUDRnTm5URnErYXBKcW03UGIwUzRTZTVJVnlr?=
 =?utf-8?B?SGpqTm12bi9sSDltbkhiaVZPUWJuNXBuME55REY5WWFwRC82azViRnhyckRC?=
 =?utf-8?B?TkdYQktuOXhUVjRuZjUzcFpPU0NWLzhlYVI1c1hhcDRaSXUrTXZjbGg5V3lv?=
 =?utf-8?B?bTEzdW11c1BrMGhCZHNIU1p4K0NEbzVSNm9FTTlES0QvWEprd1NZeFpEMjZD?=
 =?utf-8?B?czZhTmdKNUw2elFOeHBBT2srSkJIVFpPYTVqSnBSbEtLVWJYM3F1cFViOXVE?=
 =?utf-8?B?eUdCbFpvM1hud016L05TYkN1dDFldFNUSXI1clRLMFoya0UzYUhXTzJqOFph?=
 =?utf-8?B?NWFrelBScjZMT2NjbkpiSUVoTHZQZnJKME1XVnNGWUxaYXpXRFV0N0J1NDNK?=
 =?utf-8?B?am80K0FpK1RudWJuMmJGWHJlOU8zMU8zNkV4WVhqY1dZL1F4bFFaS0gwWHZJ?=
 =?utf-8?B?NjZ4U1RGbUkyaXNSUDlsZjRScW5vWFpDV2tyQXZjZXJ4VGQxcWE3eGxiZU0x?=
 =?utf-8?B?UmxTcmV3SG93SzNLZTAvT2F3bXM5L2xFbmlDL1RoUlRhLzdQRUQ0UDlTbmYr?=
 =?utf-8?B?YjM0cktOWldkMzJoN0NYVWhwRG9SeUt2VjkvKzYrRVcyYTAwUGM3MmVuWDNx?=
 =?utf-8?B?T0ZFOHFmUExQWlNLVWRsM28rUy9nTlJzUHZNL3VXRmQyejVUWXA3TCtUYmRO?=
 =?utf-8?B?VE1CNmxTdmh5Y3RXTi91NU1qdUlLZkFLa3RlMWNXQ2RzamMyMjJkMFJiUnpM?=
 =?utf-8?B?bEZxYTNlL3ZKMEF0cFlGdWdiTHFlS0g4cmwxWDFTdzlRVWxkKzd6eWRIaFps?=
 =?utf-8?B?cktFck5McXFmTmluSk9JclhFZVRnK21aUml6YkVvQld2MXVtempIalM3bjBI?=
 =?utf-8?B?bVhzM1hIczM3OEtGTEdxeWxnb3E1OTNQNVA1ZGY1eFltY293YmlCS2JrajlW?=
 =?utf-8?B?VDhuOEZwZ21sUG13U1JZQVFkNE91MUpiQWt5ejgyb0hnZGswLzZvTStRNldE?=
 =?utf-8?B?MjMwaHR4Y1UvdWRzeGJONjA1blpZZ0NhNERra0gwTU9ZWlZ0aHV4N1hwK2Rq?=
 =?utf-8?B?bGlhcmlUcmNMWE5nVmdHejM4QkkvZUZBT3MrMitKYlBUTmgvb29oUWFVMzZV?=
 =?utf-8?B?M1E5QXBTemtaajN1dVBOSk9GZitmSUttSWdaemlEcWs1OFkvd0VmTHdYUkw4?=
 =?utf-8?B?Z1RCS1N0WkdiQ2c5YzR4YVpIMXBnOFFXODk4cWlhZ0l0K2h1Wi82YTB0Q0FW?=
 =?utf-8?B?b2RtTG5vK012YzVoV3I0MVN1czFVMXIrK3lwd0J3WGgrVDF0NDZzb2VtRmxP?=
 =?utf-8?B?UGJ5Vm05R3JjbkpwVWt3STVIMWJZVGhkZEk5a09DOVB5TE1tUFhZYkMzamxP?=
 =?utf-8?B?WUFQYTkweVVMSkxQV0xDZEFvYStsRVNNbkdQOTJrOXlaTmsvQzBZdy8wdTMy?=
 =?utf-8?B?d1BPU0JEbXpxczd6ak04N3p2aHJuR1hEd0llanB5SENUcEU2MUFnZkJ5SEFG?=
 =?utf-8?B?dXZMcG1vUkRYdVI0Z3JmUkVsc0dLVDFTNzJUNFFzT0FsUkxISTJvRE10WnJQ?=
 =?utf-8?B?dWUzRG9mRzVVVGxrbWpieHczYjZ1d05SMzZvbUREMGFUb3dEOG44M0c1cUt5?=
 =?utf-8?B?c0dYdWIyT1BwRlBRQWZuMlV1azczTFUrOVY4eGlJMjhZeFBPdDBKRTg0SjlJ?=
 =?utf-8?B?WDR5bng0SGVWZGJRSUEycmMrcjZVWmVYWWR1Vk96THd5NmFqSXdxQzk0SVhZ?=
 =?utf-8?B?a2NWbEVNdFdyVC8xMElKbGtWUVR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9f2b09-26e6-4c72-335e-08dbaa889b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 01:13:10.0256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSvbLZf7fGBFc3IV+B+rQahrSJETdg7VFlPoUJgb1TL1pu7jZdCRoFg8pZc1ho/t/S2UGtQGgYA0Gm7OuGuBQLBsqti762PX1pmmyQem3+xHHv3bAMNLd6YQUlwdPvbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8646
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEF1Z3VzdCAzMSwgMjAyMyAxMDoxMyBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAzOjE44oCvUE0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCBi
aW5kaW5ncyBmb3IgUmVuZXNhcyBSLUNhciBHZW40IGFuZCBSLUNhciBTNC04IChSOEE3NzlGMCkN
Cj4gPiBQQ0llIGhvc3QgbW9kdWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJv
IFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+IFJldmlld2VkLWJ5OiBTZXJn
ZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9yY2FyLWdl
bjQtcGNpLWhvc3QueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTIzIEBADQo+IA0KPiA+ICsgIHJlc2V0
czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHJlc2V0cy1uYW1lczoNCj4g
DQo+IHJlc2V0LW5hbWVzDQoNCk9vcHMhIEknbGwgZml4IGl0Lg0KDQo+ID4gKyAgICBpdGVtczoN
Cj4gPiArICAgICAgLSBjb25zdDogcHdyDQo+ID4gKw0KPiA+ICsgIG1heC1saW5rLXNwZWVkOg0K
PiA+ICsgICAgbWF4aW11bTogNA0KPiA+ICsNCj4gPiArICBudW0tbGFuZXM6DQo+ID4gKyAgICBt
YXhpbXVtOiA0DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4g
PiArICAtIHJlZw0KPiANCj4gTWlzc2luZyAicmVnLW5hbWVzIi4NCg0KSSBnb3QgaXQuIEknbGwg
YWRkIGl0Lg0KDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAt
IGNsb2NrLW5hbWVzDQo+ID4gKyAgLSBwb3dlci1kb21haW5zDQo+ID4gKyAgLSByZXNldHMNCj4g
PiArICAtIHJlc2V0LW5hbWVzDQo+ID4gKw0KPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9yOGE3NzlmMC1jcGctbXNzci5oPg0KPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9yOGE3NzlmMC1zeXNjLmg+DQo+ID4gKw0KPiA+
ICsgICAgc29jIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiArICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArDQo+ID4gKyAgICAgICAgcGNpZTogcGNpZUBl
NjVkMDAwMCB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzlm
MC1wY2llIiwgInJlbmVzYXMscmNhci1nZW40LXBjaWUiOw0KPiA+ICsgICAgICAgICAgICByZWcg
PSA8MCAweGU2NWQwMDAwIDAgMHgxMDAwPiwgPDAgMHhlNjVkMjAwMCAwIDB4MDgwMD4sDQo+ID4g
KyAgICAgICAgICAgICAgICAgIDwwIDB4ZTY1ZDMwMDAgMCAweDIwMDA+LCA8MCAweGU2NWQ1MDAw
IDAgMHgxMjAwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgPDAgMHhlNjVkNjIwMCAwIDB4MGUw
MD4sIDwwIDB4ZmUwMDAwMDAgMCAweDQwMDAwMD47DQo+IA0KPiBUaGUgbGVuZ2h0ICIweDBlMDAi
IGRvZXMgbm90IG1hdGNoIHlvdXIgRFRTIHBhdGNoDQo8c25pcCBVUkw+DQoNCkl0IHNlZW1lZCBt
eSBEVFMgcGF0Y2ggd2FzIG5vdCBjb3JyZWN0LiBBbHNvLCBhcyB5b3UgbWVudGlvbmVkIG9uIHRo
ZSBvdGhlciBlbWFpbCBbMV0sDQpJIHNob3VsZCBhZGQgYSByZWcgZm9yICJwaHkiLiBJJ2xsIHJl
dmlzZSB0aGUgZHQtYmluZGluZ3MgZG9jLg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NB
TXVITWRXcnJ3d1k9OGJ5U0RWWWM5akQ5emRLYmVOeXREVlVTbTd2Y2k2TE49ZzZRZ0BtYWlsLmdt
YWlsLmNvbS8NCg0KPiANCj4gPiArICAgICAgICAgICAgcmVnLW5hbWVzID0gImRiaSIsICJkYmky
IiwgImF0dSIsICJkbWEiLCAiYXBwIiwgImNvbmZpZyI7DQo+ID4gKyAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDM+Ow0KPiA+ICsgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4g
PiArICAgICAgICAgICAgYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47DQo+ID4gKyAgICAgICAgICAg
IGRldmljZV90eXBlID0gInBjaSI7DQo+ID4gKyAgICAgICAgICAgIHJhbmdlcyA9IDwweDAxMDAw
MDAwIDAgMHgwMDAwMDAwMCAwIDB4ZmUwMDAwMDAgMCAweDAwNDAwMDAwPiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgPDB4MDIwMDAwMDAgMCAweDMwMDAwMDAwIDAgMHgzMDAwMDAwMCAwIDB4
MTAwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICBkbWEtcmFuZ2VzID0gPDB4NDIwMDAwMDAgMCAw
eDAwMDAwMDAwIDAgMHgwMDAwMDAwMCAxIDB4MDAwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDE3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDE4IElSUV9UWVBFX0xFVkVM
X0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDIyIElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KPiANCj4gV2hhdCBhYm91dCBTUEkgNDE5LCA0MjAsIDQyMT8NCg0K
VGhlc2UgU1BJIGludGVycnVwdHMgY2Fubm90IG1hdGNoIHRoZSBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGNpL3NucHMsZHctcGNpZS55YW1sLg0KQWxzbywgSSBjYW5ub3QgZGVz
Y3JpYmUgdGhlIGRldGFpbCBvZiB0aGVzZSBTUEkgaW50ZXJydXB0cyBiZWhhdmlvciBiZWNhdXNl
IG9mIHRoZSBkYXRhc2hlZXQNCmRvZXNuJ3QgbWVudGlvbiB0aGUgZGV0YWlsLi4uIFNvLCBJIGRp
ZG4ndCBkZXNjcmliZSB0aGVtLg0KDQo+ID4gKyAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9
ICJtc2kiLCAiZG1hIiwgInNmdF9jZSIsICJhcHAiOw0KPiA+ICsgICAgICAgICAgICAjaW50ZXJy
dXB0LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8
MCAwIDAgNz47DQo+ID4gKyAgICAgICAgICAgIGludGVycnVwdC1tYXAgPSA8MCAwIDAgMSAmZ2lj
IEdJQ19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPDAgMCAwIDIgJmdpYyBHSUNfU1BJIDQxNiBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAzICZnaWMgR0lDX1NQ
SSA0MTYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8MCAwIDAgNCAmZ2ljIEdJQ19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+
ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDYyND4sIDwmY2xrcmVmPjsNCj4g
PiArICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJyZWYiOw0KPiA+ICsgICAgICAg
ICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OUYwX1BEX0FMV0FZU19PTj47DQo+ID4g
KyAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDYyND47DQo+ID4gKyAgICAgICAgICAgIHJlc2V0
LW5hbWVzID0gInB3ciI7DQo+ID4gKyAgICAgICAgICAgIG51bS1sYW5lcyA9IDwyPjsNCj4gPiAr
ICAgICAgICAgICAgc25wcyxlbmFibGUtY2RtLWNoZWNrOw0KPiA+ICsgICAgICAgICAgICBtYXgt
bGluay1zcGVlZCA9IDw0PjsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gDQo+IEJU
VywgSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRvIG1ha2UgdGhlIG9yZGVyIG9mIHRoZSBwcm9w
ZXJ0aWVzIGFuZA0KPiBpbiB0aGUgZXhhbXBsZSBtYXRjaCBiZXR3ZWVuIHRoZSBob3N0IGFuZCBl
bmRwb2ludCBiaW5kaW5ncywgdG8gbWFrZQ0KPiB0aGUgb3V0cHV0IG9mDQo+ICJkaWZmIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcmNhci1nZW40LXBjaS17aG9zdCxlcH0u
eWFtbCINCj4gYXMgc21hbGwgYXMgcG9zc2libGUuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdn
ZXN0aW9uISBJJ2xsIHJldmlzZSB0aGUgZHQtYmluZGluZ3MgZG9jLg0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo+IA0K
PiANCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gY2xvY2st
bmFtZXMNCj4gPiArICAtIHBvd2VyLWRvbWFpbnMNCj4gPiArICAtIHJlc2V0cw0KPiA+ICsgIC0g
cmVzZXQtbmFtZXMNCj4gPiArDQo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4g
PiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL3I4YTc3OWYwLWNwZy1tc3NyLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4YTc3OWYwLXN5c2MuaD4NCj4gPiArDQo+ID4gKyAgICBz
b2Mgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICNz
aXplLWNlbGxzID0gPDI+Ow0KPiA+ICsNCj4gPiArICAgICAgICBwY2llOiBwY2llQGU2NWQwMDAw
IHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OWYwLXBjaWUi
LCAicmVuZXNhcyxyY2FyLWdlbjQtcGNpZSI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwwIDB4
ZTY1ZDAwMDAgMCAweDEwMDA+LCA8MCAweGU2NWQyMDAwIDAgMHgwODAwPiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgPDAgMHhlNjVkMzAwMCAwIDB4MjAwMD4sIDwwIDB4ZTY1ZDUwMDAgMCAweDEy
MDA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICA8MCAweGU2NWQ2MjAwIDAgMHgwZTAwPiwgPDAg
MHhmZTAwMDAwMCAwIDB4NDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgcmVnLW5hbWVzID0gImRi
aSIsICJkYmkyIiwgImF0dSIsICJkbWEiLCAiYXBwIiwgImNvbmZpZyI7DQo+ID4gKyAgICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDM+Ow0KPiA+ICsgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwyPjsNCj4gPiArICAgICAgICAgICAgYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47DQo+ID4gKyAg
ICAgICAgICAgIGRldmljZV90eXBlID0gInBjaSI7DQo+ID4gKyAgICAgICAgICAgIHJhbmdlcyA9
IDwweDAxMDAwMDAwIDAgMHgwMDAwMDAwMCAwIDB4ZmUwMDAwMDAgMCAweDAwNDAwMDAwPiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgPDB4MDIwMDAwMDAgMCAweDMwMDAwMDAwIDAgMHgzMDAw
MDAwMCAwIDB4MTAwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICBkbWEtcmFuZ2VzID0gPDB4NDIw
MDAwMDAgMCAweDAwMDAwMDAwIDAgMHgwMDAwMDAwMCAxIDB4MDAwMDAwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDE3IElSUV9UWVBFX0xFVkVM
X0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDE4IElSUV9U
WVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkg
NDIyIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtbmFt
ZXMgPSAibXNpIiwgImRtYSIsICJzZnRfY2UiLCAiYXBwIjsNCj4gPiArICAgICAgICAgICAgI2lu
dGVycnVwdC1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNr
ID0gPDAgMCAwIDc+Ow0KPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwID0gPDAgMCAwIDEg
JmdpYyBHSUNfU1BJIDQxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwwIDAgMCAyICZnaWMgR0lDX1NQSSA0MTYgSVJRX1RZUEVfTEVWRUxf
SElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAwIDAgMyAmZ2ljIEdJ
Q19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPDAgMCAwIDQgJmdpYyBHSUNfU1BJIDQxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
Cj4gPiArICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA2MjQ+LCA8JmNsa3JlZj47
DQo+ID4gKyAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAicmVmIjsNCj4gPiArICAg
ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzlGMF9QRF9BTFdBWVNfT04+Ow0K
PiA+ICsgICAgICAgICAgICByZXNldHMgPSA8JmNwZyA2MjQ+Ow0KPiA+ICsgICAgICAgICAgICBy
ZXNldC1uYW1lcyA9ICJwd3IiOw0KPiA+ICsgICAgICAgICAgICBudW0tbGFuZXMgPSA8Mj47DQo+
ID4gKyAgICAgICAgICAgIHNucHMsZW5hYmxlLWNkbS1jaGVjazsNCj4gPiArICAgICAgICAgICAg
bWF4LWxpbmstc3BlZWQgPSA8ND47DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4g
LS0NCj4gPiAyLjI1LjENCj4gPg0KPiANCj4gDQo+IC0tDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=
