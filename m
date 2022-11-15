Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A0062972B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 12:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiKOLUI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 06:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiKOLTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 06:19:47 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534C9264A4;
        Tue, 15 Nov 2022 03:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIlYrf2eepgrEZyhCWiuza9BDuaJWRINtclku3yv/iVVyY+d6g4kjaJRcquhV5W944gMCPzA/4QjKD6Agi+ImZ0gMBgc3YIlnUUD8FR/zMgAB26fhUQ+zsmSp22nbLkerxsZhJvxGjNlSMVDrV6OVTTjhrQKM4RtTPQ96QsNWdbqzizbaWDmss8rmfq0TI51s9VHiArduqNIWwfmXGYLvSAVNAuo0QAqruvBRmMevfdMD3ENtzhHnFQi2cNLNgi86ef4VBJ+kE4vgTg5PVjRS5mszu81RhbXdKyiXDHxACqLum+jry8bPfifreXim1RBGhd1+RwlwuMbwtkYkcPrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOA0fGGWZoG3/sRsUJhuhAPU4x94Xxi+MbYJG80/GhI=;
 b=ilqMLCXaMj1kYKkOeiLy3YaomUE3zJEKnuO/ISrA4j1zM/ILOKt+kArSZTUbTuv+27p+iNNRvHxHoe6mTD7FqXh7tl/UWd/GAssE5KdZdWEfnK6CIKtFBpuBQVpee4+b4k86g4/xEwikQZFbOVVSjqo9AWxKKhZn06BGIBxXUbbwd6qBeaXqY/ZDOqZ8l2WZ1f7f1GF54iCteB3hBkeGejyTxBtd82in7/PKLW8XYtrz34Ek0FIM7Blc02O/KsZ6EWfZ0tFH7dhKc6iiAYUSk+CPnXX7ASCGWSRXbnVLvYdQr9sjnhLLD3fmsbPJh7iqe7LpJY4wfvUWqspOQs9mWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOA0fGGWZoG3/sRsUJhuhAPU4x94Xxi+MbYJG80/GhI=;
 b=E1UqCcsdNmlfWRbeiJu2++CxBcJkmehFTVXGg7mK8yFoksdm6Ffk77T4duQnxEh3Gul1+jOl/hKkF0VStJ03IUvsU8TgFnKXmuJvwNFLWk2QzZT+SgecolsLvmt6Obb2kbAUxXL4S2Rh7Of7L8NF9gMjBrtDceEHhFiWDewFurg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6295.jpnprd01.prod.outlook.com (2603:1096:604:eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 11:19:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 11:19:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsggAAD6gCAAACZMIAAJtqAgAABIaCAANe1AIAAL6vQ
Date:   Tue, 15 Nov 2022 11:19:41 +0000
Message-ID: <OS0PR01MB5922E8CD3F8CE372C63179A186049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
 <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
 <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
 <OS0PR01MB59220BB367224A4215365F0E86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6295:EE_
x-ms-office365-filtering-correlation-id: d5288e6f-c674-4e15-dc1d-08dac6fb4ad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ke1ZoW3gRe+2+IXtMc7bJeYMjuJbSr+IOtnxXB01JX2APYNwfTPvku4MAuBllf5uTkkHCWTiVqLdv4Fz9V0rjb6W5kfQb+2DevmL4rIwy5yMpccvUK2ko7doZN7434BqF5g7Gy/aNYRjew2T4HAjo5nyyY2Z362kEJXA52iwIorp4CRA7Q9w19pOnv6EsbNrUXLq9MlDP0h9VErs48qc15Pyib4us+aa+Ttsuk0qM/lCwS4aDPIwbxgJblYCNHE9Kiq3XUDgelCWPVDM+eOM1a34m1MeeeIh6y6h2FZScDx47EZm/UNwBlFpnhrRze+OS3WEDUt2nR93e/CgfvfTVEheyjtwRQglSuBvhujnTfCbDsFO68k8JHUR8+GhhInyhy1x2WspLVMrh1fcMLxhFVD0eoIrtqMJfHfwr6N+OqkdWtshHYZNg+zfmPBLkvCV1wXBv9qqv6Ha93KyRw/fcJUjYZmnt4G3/FSAdTfP02+rTxoT1aF0J3F1i4ddwNMnohR3MJSukAIchbZMLjMXN8vUxvmH1vTIUT6KTmjbNOcTHeJqBOHS5kjmzAeJZ98S4HHeQpat0BPyQ7dMGfNeug19bhG2Y5R1u/EHwScgZgc4Dl+aLDL16Q8CHhJpx5//7dFOm+62ep7tSFrFBoIPobl5jpWeqgy15NHoocePBTH8ATHz6yL4jpCU6rp6aPp662QCxrDWwpk+18qQFpTTIi7F2XYWUqSig63dsLOAsYQyOMx/wzkR/7Ht49FSR2QTv+OijkbSInNpcZ9WxvfWng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(122000001)(54906003)(6916009)(316002)(33656002)(52536014)(66556008)(38100700002)(66476007)(5660300002)(8936002)(76116006)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(38070700005)(26005)(7696005)(186003)(64756008)(9686003)(478600001)(55016003)(86362001)(107886003)(71200400001)(66446008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T21PcFR4Nm1BaTBMVysrTnowR0pWdmlDZFNQK3FBbmJOb1MwLzNFc2VWdkN4?=
 =?utf-8?B?Skt6K1hjT2x0UENtbTBUQllGbEFjVTlHbThoTUlXa0ZGQ1lHUThLb0h5dEMw?=
 =?utf-8?B?SHhQQjhVYTF3dmlEb05CQzY3dzF4SjhSamY1bVluWTQ3eStSeGszNmduTGJE?=
 =?utf-8?B?ZU5CeE4rcGFYSTh5TU1VZm54MldHSE0zb2ZvWUNJNlNSY2pNVDBVZHFUV3Yw?=
 =?utf-8?B?MTJ5Z1dCTTV6UDRpSVQwMWkwSE5MMXlXQ3U2NVZwNGZ4QTFtN05aVzQrT0I3?=
 =?utf-8?B?WmFCbVBtNGJnc1UwZXp2U0NoTGkzSU9ka1V3UVFLWTRNMUpaaU95TWZtZklT?=
 =?utf-8?B?OXRUQnlEZGlMUWUyck9NR0lJNHlDVEoxQnVQT0ZrOTNpY2V2dTJiWm1GQi9V?=
 =?utf-8?B?QmtOd3I4ZSs0d1BneHF1TFV0RklHa2d4QlVrNTY0OHJrQ29wU0xTWWdKUmg3?=
 =?utf-8?B?VUZjWUJCRUVLSU4zejR6cEs4STVNUUpIVFNid1lxalEvcmEyM1NEbjM5Mytr?=
 =?utf-8?B?dTlJc1NSQWM2VHhQR29EYmNJdnpvL2s4c1EveFpMMkhHRVZCYjZHY0VuMDll?=
 =?utf-8?B?dGsvNkU5Q1I1QVlHdGlMbm56Q0k3eDdyL3ZQaXd6V3kvZ0hTU1Q5TDM0QTNk?=
 =?utf-8?B?bXQ2NW9XWEtCODJPSjc3NE1sa0VxR24waHFSWERJazV5Y1Rac3NkWW5YMjBH?=
 =?utf-8?B?RDRzSnA3cUFDVkl3bDJTVEw0Z1JBUm0vZGE1S1dxZ2ZjWUp0QWpueVkwdlJF?=
 =?utf-8?B?MStVMlN6Y1U0dkNKdGg1eGhGRzFCWUhsNE5XWmFXMGwrWkdIRjJSTFpSWjV1?=
 =?utf-8?B?cUtrZFpOQVpHbU1LejhCYm0xKzlMekVlbXV2a3pyMzhSWFNKUjhKZHBSZjNk?=
 =?utf-8?B?R29rb200ZzdnVURjdGtBQnVTTFBiRzBXY0d0bUx5NCs1Ni9IdXlueTNXUVpl?=
 =?utf-8?B?TlI2VENtSDFCakI3dXFUQURwdUk2b3Q3dDhWdTY0VmVvN0E5L2ZGMXNOcjBI?=
 =?utf-8?B?OVFjbk4zTFA3WUpmZllHeEFtWVdSMVlFeFpkb1VLSUk3YVN2VC9ZckRWU3la?=
 =?utf-8?B?bHBMQ2h1QnFYT0NWWlYwU2Vzam1Rb1VxQ2lsVmp1MjEzVERVVWNpbWt4bW5R?=
 =?utf-8?B?eDJQWG9QTnFwT2FyMjRYOWxwVElYMnEwbzA0ZXZXVTRMd3FvbmF2aDNpUzNs?=
 =?utf-8?B?WDJsZ2lRVmR5VkNrWU81V0oySDZtTG9DbHBQTkNtc3QrSzNNVUxlNDZJUUVB?=
 =?utf-8?B?MlJtYXJYNTRKeVpMcWh1Qk4zSS9wQms1cWdJSFo2N2JqL1RhUUY5TEkvOFJH?=
 =?utf-8?B?bGt6OU5tQmw1TW1TMnJlV2tTS1JHZlJiNGIvTUxoRVBwNWxKSEtsM3lnSjlZ?=
 =?utf-8?B?MXJwM0c1MHFOVEQzOEowR0pZU3laOGJ6YWpkM2U4djN3eEV6akpwU3F1L2NJ?=
 =?utf-8?B?ckoxcUxjYlVrYjR5Qjl5WmdkVGY4OUFrTUpPdTJFdDJRMXZjTUlXME10ZElH?=
 =?utf-8?B?WUViTmhRekFLbm82VkEwc1hFT3RzK2NKeUluVmFTb0dYb3pBV1F4K09MVmZV?=
 =?utf-8?B?aWxEZG1pQkhKMW91S3FEejdNU0NtVHNVMkpPeWN1L0VwM3R0RmovVm5oVmE1?=
 =?utf-8?B?bGRremtEcXB5emFpS3pjbXJmWDFIaCtJOGZaRGpzZENxbHdHUDJVT0dURUVp?=
 =?utf-8?B?THhZeXdEZlJYRWo5cXJUTVFJNHF2UTBEdEhxcDhWeTNlWEFsZ04rSVFnK0Mx?=
 =?utf-8?B?Z3RRb2JFWkNPbWdtNTRzT29pL3p1OWJaelZDcUpCVHROQlJBbkd4UEtvTEMr?=
 =?utf-8?B?VHByVUFKTDMvaTlFbWxBK2ZYb2tNRlh3NWlkWnhGWHByc0gvNU9BblVsRTJT?=
 =?utf-8?B?VVlyMXV2NzZjeWR6bUVxSnRpUzkrOW9xNGt0S0RIZnJuRWI3bEt5alAzcWxo?=
 =?utf-8?B?KzJ6aGlPcUtMdjFQYjRCT203S1ExSTgrYmp1RWhYc0RSemR2c0VnNmVQZEpS?=
 =?utf-8?B?WDRKR2lNMTB6T0JNREFKOWJqaVNtejlwcmF4YXl0aFA5Z0NhcEthNmNkTGty?=
 =?utf-8?B?SHZ1NndWMVVUTzVtUlNaV29VZGx1OTM2Z1JmcEorbVF4MzdSQWVEanV5cnBD?=
 =?utf-8?B?R09PaGQ2VU9COFRFR1J6bkV4cU5kTnhxc2VKaU9sVUg2TFlEQkJvajZmU1Ra?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5288e6f-c674-4e15-dc1d-08dac6fb4ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 11:19:42.0144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZO3AhOxlhB4LI9kG+6UHhNgVHRBi8cbjPQDK2EW16/Rgr85bVAYEEHQqthDaSuu1LaNBy3uoYgr1BEF9aD1bCzulYaZ4KmY5Urf6Q5T5kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6295
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBh
cm06IHJlbmVzYXM6IERvY3VtZW50DQo+IFJlbmVzYXMgUlovVjJNIFN5c3RlbSBDb25maWd1cmF0
aW9uDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBOb3YgMTQsIDIwMjIgYXQgODoyMiBQ
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IERv
Y3VtZW50DQo+ID4gPiBSZW5lc2FzIFJaL1YyTSBTeXN0ZW0gQ29uZmlndXJhdGlvbiBPbiBNb24s
IE5vdiAxNCwgMjAyMiBhdCA2OjA1DQo+IFBNDQo+ID4gPiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gT24NCj4gPiA+ID4gPiAxNC8xMS8y
MDIyIDE3OjQ0LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+Pj4+PiBJZiB0aGUgaGFyZHdh
cmUgbWFudWFsIHNhaWQgdGhpcyBpcyBjYWxsZWQgImZvby0NCj4gd2hhdGV2ZXItbmFtZSINCj4g
PiA+ID4gPiA+Pj4+PiBvciAicno4NTczNmRmbngyIiwgeW91IHdvdWxkIHVzZSBpdCBhcyB3ZWxs
Pw0KPiA+ID4gPiA+ID4+Pj4+DQo+ID4gPiA+ID4gPj4+Pj4gTm9kZSBuYW1lcyBzaG91bGQgYmUg
Z2VuZXJpYy4NCj4gPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPiA+Pj4gSSBnb3QgdGhlIGZvbGxvd2lu
ZyBmZWVkYmFjayBmcm9tIExTSSB0ZWFtLg0KPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4+PiAq
VGhlIHJlYXNvbiB3aHkgd2UgdXNlICJjb25maWd1cmF0aW9uIiBhbmQgbm90DQo+ICJjb250cm9s
bGVyIg0KPiA+ID4gPiA+ID4+PiBpcyB0aGUgcG9zc2liaWxpdHkgdGhhdCB1c2VycyBtaWdodCB0
YWtlIGl0IHRvIG1lYW4NCj4gPiA+ID4gPiA+Pj4gImNvbnRyb2wiIG9mIHN5c3RlbSBvcGVyYXRp
b24gKHByb2R1Y3Qgb3BlcmF0aW9uKS4gVGhpcw0KPiB1bml0DQo+ID4gPiA+ID4gPj4+IGRldGVy
bWluZXMgaG93IHRoZSB3aG9sZSBMU0kNCj4gPiA+ID4gPiA+PiBjb25maWd1cmUgdG8gb3BlcmF0
ZSBMU0ksIHNvIHdlIHVzZSAiY29uZmlndXJhdGlvbiIgZm9yDQo+IHRoaXMgSVAgbmFtZS4NCj4g
PiA+ID4gPiA+Pj4NCj4gPiA+ID4gPiA+Pj4gQXMgcGVyIHRoaXMgaXQgaXMgbm90IGEgY29udHJv
bGxlci4gSXQgaXMgYSBDb25maWd1cmF0aW9uDQo+IElQLg0KPiA+ID4gPiA+ID4+Pg0KPiA+ID4g
PiA+ID4+PiBXaGF0IHNob3VsZCBiZSBnZW5lcmljIG5vZGUgbmFtZSBmb3Igc3lzdGVtIGNvbmZp
Z3VyYXRpb24NCj4gSVA/DQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBUaGVuIGl0J3MgY2xv
c2VyIHRvIGNoaXBpZCBhbmQgc2hvdWxkIGJlIGluIGh3aW5mbz8NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBZb3UgbWVhbiwgc3lzOiBod2luZm9AYTNmMDMwMDAgaW5zdGVhZCBvZiBzeXM6IHN5
c3RlbS0NCj4gPiA+ID4gPiBjb25maWd1cmF0aW9uQGEzZjAzMDAwID8/DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBSYXRoZXIgYmUgcHV0IGluIGh3aW5mbyBkaXJlY3RvcnkuIFR5cGljYWwgbmFtZSBp
cyAiY2hpcGlkIiwNCj4gYnV0DQo+ID4gPiA+ID4gSSBkb24ndCBrbm93IGlmIHlvdXIgZGV2aWNl
IGlzIGEgY2hpcGlkLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIElQIGlzIGZvciBzdXJlIG5vdCBh
IGNoaXBpZC4gV2UgY2FuIGRldGVjdCBTb0MgdmVyc2lvbi4NCj4gVGhhdA0KPiA+ID4gPiBpcyBv
bmUgb2YgdGhlIGZ1bmN0aW9ucyBwcm92aWRlZCBieSB0aGlzIElQLg0KPiA+ID4gPg0KPiA+ID4g
PiA+ID4gQWxzbyB0aGUgc2FtZSBJUCBibG9jayBpcyBwcmVzZW50IG9uIHJ6L3YybWEgYXMgd2Vs
bD8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTaGFsbCBJIHVzZSB0aGUgc2FtZSBmaWxlIHJl
bmVzYXMscnp2Mm0tc3lzLnlhbWwgZm9yIGJvdGgNCj4gPiA+ID4gPiA+IHI5YTA5ZzAxMS1zeXMg
YW5kDQo+ID4gPiA+ID4gcjlhMDlnMDU1LXN5cz8NCj4gPiA+DQo+ID4gPiBBcmUgdGhleSBzdWZm
aWNpZW50bHkgc2ltaWxhcj8gRS5nLiB3ZSBoYXZlIHJlbmVzYXMscnN0LnlhbWwgZm9yDQo+IHRo
ZQ0KPiA+ID4gdmFyaW91cyBSLUNhciByZXNldCBjb250cm9sbGVycywgd2hpY2ggaGF2ZSBkaWZm
ZXJlbnQgcmVnaXN0ZXINCj4gbGF5b3V0cy4NCj4gPg0KPiA+IEkgaGF2ZSBiZWVuIHRvbGQgYm90
aCBSWi9WMk0gYW5kIFJaL1YyTUEgYXJlIGV4YWN0bHkgc2FtZSwgYnV0IGxhdGVyDQo+IGRvZXMg
bm90IGhhdmUgSVNQIG1vZHVsZS4NCj4gDQo+IE9LLi4uDQo+IA0KPiA+ID4gSWYgdGhlIFNvQyB2
ZXJzaW9uIHJlZ2lzdGVyIGlzIGxvY2F0ZWQgYXQgdGhlIHNhbWUgb2Zmc2V0LCBpdA0KPiBtaWdo
dA0KPiA+ID4gYmUgd29ydGh3aGlsZSB0byBhZGQgYSBmYW1pbHktc3BlY2lmaWMgY29tcGF0aWJs
ZSB2YWx1ZSwgdG9vLCBzbw0KPiB0aGUNCj4gPiA+IHNvY19kZXZpY2UgZHJpdmVyIGRvZXNuJ3Qg
aGF2ZSB0byBjb250YWluIGEgYmlnIGxpc3QgdG8gbWF0Y2gNCj4gYWdhaW5zdC4NCj4gPg0KPiA+
IFRoZSBTb0MgdmVyc2lvbiByZWdpc3RlcnMgYXJlIGxvY2F0ZWQgYXQgdGhlIHNhbWUgb2Zmc2V0
Lg0KPiA+IEJ1dCB0aGVyZSBpcyBubyB3YXkgdG8gZGlzdGluZ3Vpc2ggYm90aCB0aGUgU29Dcy4N
Cj4gDQo+IFNvIHRoZXkgcmVhbGx5IGFyZSB0aGUgc2FtZSBTb0MsIHdpdGggdGhlIElTUCBkaXNh
YmxlZCAoYnkgZnVzZXM/KS4NCj4gDQo+IFRoZW4gSSBndWVzcyB0aGUgbW9zdCBzZW5zaWJsZSB0
aGluZyB0byBkbyBpcyB0byBqdXN0IHVzZQ0KPiANCj4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNh
cyxyOWEwOWcwNTUiLCAicmVuZXNhcyxyOWEwOWcwMTEiDQo+IA0KPiBhdCB0aGUgdG9wIGxldmVs
LCBhbmQga2VlcCBhbGwgb3RoZXIgY29tcGF0aWJsZSB2YWx1ZXMgdW5jaGFuZ2VkPw0KPiBDZnIu
IHdoYXQgd2UgZGlkIGZvciBSLUNhciBHZW4zZSAocjhhNzc5bVgpLg0KDQpPSywgVGhhbmtzIGZv
ciB0aGUgcG9pbnRlcnMuDQoNCldpbGwgc2VuZCBWMyB3aXRoIGZpbGUgbmFtZSBhcyByZW5lc2Fz
LHJ6djJtLXN5cy55YW1sIGFzIEtyenlzenRvZiBtZW50aW9uZWQsDQpXZSBjYW4gaGF2ZSBnZW5l
cmljIGZpbGUgbmFtZSxpZiB0aGUgZmlsZSBjb250YWlucyBtdWx0aXBsZSBjb21wYXRpYmxlcyhD
dXJyZW50bHkgd2UgaGF2ZSANCnI5YTA5ZzAxMS1zeXMgYW5kIHI5YTA5ZzA1NS1zeXMpLg0KDQpD
aGVlcnMsDQpCaWp1DQo=
