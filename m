Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FA74F064B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 22:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbiDBUus (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 16:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243915AbiDBUur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 16:50:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F9E5F70;
        Sat,  2 Apr 2022 13:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Ej0kVKJudxwne+3v6CyuoyCYTWWZV3FF5/UTs3tT44Sy+cJYZweBSjT5qbGhQA+xO9j59WlyEJB1cTJ2Ff3qo4iq7+oQzl8jwVjxa+4Za4vY8eFzgAefK+xuus2ls5CJMKpHGJfMZFmrOzCTnOzlUk97CYOeULRrSP7HmYDxCxEyL4vNIrKjbPkJX/1iuarN104WWKLCpUa6sZN0b50Pt5UJeP8R17AvXIZqIUzJIBp3i4+sPQe9qM6EWEdHgTzrex/t44CVXPEj4q9lcPYqC1zGXAbhbKf3JMc7/qN/pExAlBEOF7HPD46BNGi8ozMys8Kx62mzzyTJLlSkIglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79TNvDNLkT9B5zgcpj1V2GTFKYi9tC6WLd3jmhE1WGA=;
 b=IfHR0QKvdAUDvIpBoBpVNYzLZnIOpuwH2QQJOrfT+IfIcowLq7NjHg2ueNYHvKSLnqBEUT3k7igXxDImvu5soEeNNRYca/nMTeT7nxu4MbJF+CioECyADG3LwmSx1C5OalomN4pvFRl+K19tg0p8Fe0HvsFzLeBTiWiUrnbgukkUMBeEu3m4m9AazhEl/J/sqqUbeckED+jJylU2OUZGl+pMoGGb3uuitmlYep2+HNd8tQTdg+V6k5uCClBJzXcKtZ8ab6DhTuvRp4UrwlMkd6yPLCd1dtcYz/6k2iB1zY5WIgvF8OuMdd8WN7d2wBBF9uh0BnMGj7BpMCA/UOiBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79TNvDNLkT9B5zgcpj1V2GTFKYi9tC6WLd3jmhE1WGA=;
 b=g7vSHWfT6T46IB+vg6M+ROg3glzVgHSf1WpQ5QRs0ySJb3zLZDJkTfS/zwXbiPLi+zmYkUmcgryOzGMTnomRRYmUEpkhnpNUOEN7PC4Cd2lcc5lAzJctXv9HPWzXaHCwb5eksm7e9bnKW4ZSqQKZNcAo6c/KBpwHJKOlDgqrpgI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYXPR01MB1712.jpnprd01.prod.outlook.com (2603:1096:403:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Sat, 2 Apr
 2022 20:48:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 20:48:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Topic: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Index: AQHYRmPV/EWVE3M8n0+qBjpsuXfV0azc0uuAgAAmAPCAAAeYAIAACFpwgAAD34CAAAFmsA==
Date:   Sat, 2 Apr 2022 20:48:50 +0000
Message-ID: <OS0PR01MB59229D11933BE68648C78B6486E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
 <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
In-Reply-To: <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 134f967c-b1c1-4dd9-5bf9-08da14ea30fa
x-ms-traffictypediagnostic: TYXPR01MB1712:EE_
x-microsoft-antispam-prvs: <TYXPR01MB171219B71A707E8736E171FF86E39@TYXPR01MB1712.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6MfYMxnw7TEo+Nt/huxqaYN9KqslFZbkJINGoLQUqXeRdGYZxI8qKBdXyTnsCd1Iznev97i24lL8i58OTjpRmG1xKMYfgznIIXfeWM75VBf4BlHeD1ZNciCLcLHq5xH89l5kUMi3j2y4YreLYc+rVMkbpYTfB7WmWEgRxirJ1Zpr/jQftv+RiG5eNnbWB/s3n8UoPb+nb5L5DpJuA/79BtphA3smi5SvJlRWjtglIc4JrYh17KSwuiipIwfNPcGRwxrcVq9CkY+mg/PoWPaLKHsO62qQOSc13c2Mmkn6ScVBMOvqnQPXYm5TUytS1pP2pUGElr+W8h5hmhZPQYqyY7bWrbvvjDh7aZSmuCc71BgRWTacftwoyCqpBTF1rO6M/TgvubdsOVUQgnPDcFehWtw9HzCH7i4KrIBwXYC2zJQOlxF0ILdhjbeiT0RFq7gVB/p14Hv10bitX6Ace1XKovABOu6cmsIjCPJ93KGJDrEOXiDDA3gnjnf7BXC/ZdlCO9ibVuHUX/NXed5Wyo7NCPIFl6snNDvi00QyTcXNEEbreOwtImJjdgdzQ/fA1sDBX7GsWJwCI6spvGPuXivkMmuylZEQWxA+DZING6E9oYzuafRu0Vq/58ujDWO2qpTYSa01XDCmK5tc9DLC97Pqj2gorKhhJQaITxP2Aj+bDhA7zo9cNoJ2JMwp8d330v2p/s09wlUghTccdHDMvcaSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(66946007)(66446008)(38070700005)(76116006)(71200400001)(64756008)(4326008)(66476007)(66556008)(53546011)(33656002)(6506007)(107886003)(2906002)(38100700002)(8676002)(7696005)(122000001)(508600001)(26005)(8936002)(110136005)(52536014)(5660300002)(83380400001)(86362001)(316002)(55016003)(186003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTU2djhqZ3lYZ2IyYUY4US8zdG1xVzcrcTZmL3JLV1FpMWhmR2dmVUlDYWdw?=
 =?utf-8?B?S2MyN0orYUFZKzNTQnVtWkJTZklsWThRMUVKWFptWE1kL3pwY2t0QVBDblFy?=
 =?utf-8?B?OWJ3RDhNVDUwd2cwY0s1WmNhREdmM1FkQUl4RkJwRk9ZT3NGZUh0UzJ6Uncz?=
 =?utf-8?B?RDVTTDZGbmhxZUJQS0J3ZDVpUURsSzBEQmlURmFFTVF3UzJpMTcxS3pCQWZk?=
 =?utf-8?B?a0gyTHowUVdMYndrakdBMnZwK2tlK0tLMWJPWWprNGZQa2JkNk41bENZVm5r?=
 =?utf-8?B?MzNCL1hRcDcyMG1uY202dTZRR01HVGR2N2FrZnZDMXU2NW0wQ0J4UEJDVjJr?=
 =?utf-8?B?MTd6dlozNTh2RUJyUGF5SHpvb3VvMzBDVTZxcHFJT1FTSktkaFVNbnRNdisx?=
 =?utf-8?B?Z2NVSVh6L3Nuenc4NDAwelgxd1VEcGlZRWp1VnlPNDJmMXlWS3BCaSs1ZmhR?=
 =?utf-8?B?eXoycE5tRG96REF6T2dJemJycXZSMllLMFJzVzhSRmdibEpXZmtHTklJcCtk?=
 =?utf-8?B?UmJVVW1UdGJhb0EySnN0M0srTE5hUXFHYzE2Z2Vablgza0N3dWFyY2taSHlJ?=
 =?utf-8?B?aDlJVmVKOFBmZjZob2NQdEU2cUhOcDRhZ0w4Ui9YZHJIYmhJQ0ZQZkdjN0sz?=
 =?utf-8?B?WWp1cjc4c3VwT3lKbWZsamFyRDRUaG4xamFTYXNFOUtHc09SdEIyRE1sWEZB?=
 =?utf-8?B?amlwU0FTYU1iTDEwRnFYdUtubnRTZGRzWCtFNWd4aGN2QS9MTlNhdmhzKzBP?=
 =?utf-8?B?TTdZcnJpRXNEdFd5R2FEUnVDUEtsL1RBZ0lVWE1saU5CdXY0cG1wdGtNVEpQ?=
 =?utf-8?B?VkhiQnJZclUzbXJsNmN4ckFvOWRUZXpuUkZTMU5ITitYODBGRXpBMmExMHhr?=
 =?utf-8?B?eGFlR2t1TGR3dGJMaHBIeTh3bDhsNmZpMW55M0tqd1BCSnUwdE9Bd0dMbkpQ?=
 =?utf-8?B?MlBRSFNuaHZhNTAwK1lpQ3V5alFQQjdrUXp1QW9MM2hZVERweDJYUTJHUVhN?=
 =?utf-8?B?SEsxTVZXSjlTL0JURUpKSDFTQ1ZxSGcwYlBrZ3ltUHRWRzBZUTFpVWFDOGx6?=
 =?utf-8?B?NEltdWptR2R4aGVyN0tzODViaHlIZkNNc2ZWNnExSGwvanEyZG00c05GN3lH?=
 =?utf-8?B?cS8vbVJZamFHZE1udE85S2ZZODNxaTk3UWxBMVVEdXhQUTZmSW9kamJIRjhk?=
 =?utf-8?B?T2JkQlVSVm85RmZydzRMS2l6NmFDYXBFbDlXaUp1T1V5dzRFR0Npby9uRVdV?=
 =?utf-8?B?TEs1Mi9qcTVha2hocWQyZGk4a25CVFdYeWMxaGhxU0ZQczZ0d2V5M3dINDZa?=
 =?utf-8?B?VEpLYjhDbEhBOWpWYjZzYXNxamdzanNyS2RBZFkwSTAyanQyYXM5b0tKbmx1?=
 =?utf-8?B?UFJUcTcwOFd3eUdmZUk2WklLR1ZWanc1MjdjVmpLbUpkYytKeUdoSjQ1UlV4?=
 =?utf-8?B?d3JLWjdhRWNRanJ6TlIxYTd2U2hRc2xlQXhEUnRlbUFKaFhqTHEzY0tKb25r?=
 =?utf-8?B?b3lNSWp4cDJiR2oyNlNDRzE0WXdxWVVrc3hwS1FEaWd6WTBnK2hHUzM4L1hO?=
 =?utf-8?B?Q2hjWVFyZFhiN1lsazJLVG9OV2FHZXR1S2FGUGI1NGg1Q2FYcjBxRmN6ZTM2?=
 =?utf-8?B?aGpab29Td1h6QUlJa3hDbDBmRGc0T1pKQnhoRVRDRWlHRytQTzk4Q0VadWg2?=
 =?utf-8?B?TXZRVHhaZm9rdjV1TzlhMjJLUWhCNk4ycy9NSU1abDJOSW1Ca25sYnFYRXpR?=
 =?utf-8?B?RS8yZUUzamMxbHpaMUREOHpyYlJkeE45VTMyUVU1amJFWi83SlltUFF6cW15?=
 =?utf-8?B?RUhJZ0xwbHpRNjhJenJSdjZSVStqcUd2NW1xSWlRNFZESG1hK2RTUlVMbkRy?=
 =?utf-8?B?R1NETGFZR09tS3RNdUloZnZYKzZtbzhIQjA5TGtDNm5wZWwweGRJMklnVmp6?=
 =?utf-8?B?Q0NIZDJwSEJqS3dJL21XQ3RHQmk5MmVwdG1oM0VIZnlIRDFxclZCcm1xUTlm?=
 =?utf-8?B?N2lOVEV4Vms3MVJXU0xmN2tLMUJPaWx2S2V2SEhaYnpUWTdCMStjdTRzR2s0?=
 =?utf-8?B?amdTdHc0bFk5WmQ2bURiWEY2ZjhkZGk0Z1I0Nnlod04vL0Z3YjFaeGlBSldq?=
 =?utf-8?B?a0JOOWdsV2JacWoxRE1CeGZBY0crekIydk5ubGJYV3VyS0hrWmJNR3hJaFJB?=
 =?utf-8?B?bXB1Z2pRUHhMVVROUGhmdEk3OGttWXFwQldqMGZTdzVNVFlKdnBvWTludG0x?=
 =?utf-8?B?ZkhCQnJNZ2UwMWJLdys0L1Y2WGJEUnhuSlVINkl6VDFPR1JxdnVDR2xsdTNj?=
 =?utf-8?B?aDA1YmlWQUhhRzg5ZHBGVnZRN0RPQ2lLeGlJMWEwMHhUWGM4cStWWkxScXoy?=
 =?utf-8?Q?gBjPpWIbHHMuTOoQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134f967c-b1c1-4dd9-5bf9-08da14ea30fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 20:48:50.2025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/WY52oUsC3nGLmNuj01dHxsc8b6AVTfXCLTK00J4lIFOV2d33ensBYsJRCd7huT4IgXERyTH4BO6qd183ai7G32kU885XnJnp6+zeVlBAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1712
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzVdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IERv
Y3VtZW50IFJlbmVzYXMNCj4gUlovRzJVTCBTTUFSQyBFVksNCj4gDQo+IE9uIDAyLzA0LzIwMjIg
MjE6NTQsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pg0KPiA+PiBJIHVuZGVyc3RhbmQgdGhhdCBjYXJy
aWVyIGJvYXJkIGlzIHRoZSBzYW1lLCBzbyB0aGUgU29NIGRpZmZlcnMuDQo+ID4NCj4gPiBGb3Ig
UjlBMDdHMDQzIGNhc2UsIGV2ZW4gU29NIGlzIHNhbWUsIG9ubHkgU09DIGRpZmZlcnMuDQo+IA0K
PiBJIGFzc3VtZWQgdGhhdCB5b3UgY2Fubm90IGhhdmUgc2FtZSBTb01zIHdpdGggZGlmZmVyZW50
IFNvQ3MuLi4NCg0KT0ssIFdoYXQgSSBtZWFudCBoZXJlIGlzIHBpbi1tYXBwaW5nIG9mIDIgU29D
J3MoUlovRzJVTCBhbmQgUlovRml2ZSkgYXJlIHNhbWUgb24gdGhlIFNvTS4NCg0KPiANCj4gPg0K
PiA+PiBJbiB5b3VyDQo+ID4+IG1vZGVsIHRvIGZpZ3VyZSBvdXQgd2hhdCB0eXBlIG9mIGhhcmR3
YXJlIGlzIGl0LCB5b3VyIGNob2ljZSBpcyB0bw0KPiA+PiBjb21wYXJlIHR3byBjb21wYXRpYmxl
czoNCj4gPj4gcmVuZXNhcyxzbWFyYy1ldmsgKyByZW5lc2FzLHI5YTA3ZzA0M3UxMQ0KPiA+Pg0K
PiA+PiBJZiB1c2VyLXNwYWNlIGNvbXBhcmVzIG9ubHkgbGFzdCBjb21wYXRpYmxlLCBpdCBnZXQn
cyBvbmx5IFNNQVJDLCBzbw0KPiA+PiBpdCBkb2VzIG5vdCBrbm93IG9uIHdoYXQgaGFyZHdhcmUg
aXQgcnVucy4NCj4gPg0KPiA+IEJ1dCBIZXJlIHVzZXItc3BhY2UgY2FuIGVhc2lseSBpZGVudGlm
eSB0aGUgSC9XIHdpdGggZXhpc3Rpbmcgc2NoZW1lLg0KPiBTZWUgdGhlIGxvZ3MgZnJvbSB1c2Vy
LXNwYWNlLg0KPiA+DQo+ID4gLyAjIGZvciBpIGluIG1hY2hpbmUgZmFtaWx5IHNvY19pZCByZXZp
c2lvbjsgZG8gZWNobyAtbiAiJGk6ICI7IGNhdA0KPiA+IC9zeXMvZGV2aWNlcy9zb2MwLyRpO2Rv
bmUNCj4gPiBtYWNoaW5lOiBSZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEwN2cwNDN1MTEN
Cj4gPiBmYW1pbHk6IFJaL0cyVUwNCj4gPiBzb2NfaWQ6IHI5YTA3ZzA0Mw0KPiA+IHJldmlzaW9u
OiAwDQo+IA0KPiBVc2VyLXNwYWNlIGlzIG9uZSBleGFtcGxlLiBXZSBkb24ndCBsaW1pdCB0byB0
aGlzLiBBbnl3YXksIHRoZSBjb21wYXRpYmxlDQo+IGlzIHRoZSBtYWluIHdheSB0byBjaGVjayBp
dC4gTWFjaGluZSBpcyBqdXN0IHRlc3QsIG5vdCBjb21wYXRpYmxlLCBub3QNCj4gcGFydCBvZiBB
QkkuIHNvY19pZCBhbmQgcmV2aXNpb24gY291bGQgaGVscCwgYnV0IHRoZXNlIGFyZSBzZXBhcmF0
ZSBBQklzLg0KPiBUaGV5IGNhbiBiZSBub3QgY29tcGlsZWQtaW4gYW5kIHRoZW4geW91IGhhdmUg
b25seSBjb21wYXRpYmxlLg0KPiANCj4gUmVnYXJkbGVzcyB3aGV0aGVyIHRoZXJlIGlzIGFub3Ro
ZXIgd2F5IGZvciB1c2VyLXNwYWNlIHRvIGZpZ3VyZSBvdXQNCj4gaGFyZHdhcmUsIGl0IGRvZXMg
bm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHN1Y2ggdXNhZ2Ugb2YgY29tcGF0aWJsZXMgZG9lcw0K
PiBub3QgbG9vayBjb3JyZWN0IHdpdGggRGV2aWNldHJlZSBzcGVjLg0KPiAiLi4uVGhleQ0KPiAg
YWxsb3cgYSBkZXZpY2UgdG8gZXhwcmVzcyBpdHMgY29tcGF0aWJpbGl0eSB3aXRoIGEgZmFtaWx5
IG9mIHNpbWlsYXINCj4gZGV2aWNlcywgcG90ZW50aWFsbHkgYWxsb3dpbmcgYSBzaW5nbGUgIGRl
dmljZSBkcml2ZXIgdG8gbWF0Y2ggYWdhaW5zdA0KPiBzZXZlcmFsIGRldmljZXMuIg0KDQpTb2Mg
c3BlY2lmaWMgZHJpdmVyIGNvbXBhdGlibGUgd2lsbCB0YWtlIGNhcmUgb2YgdGhpcy4gSWYgYW55
IHF1aXJrcyB0byBiZSBhZGRlZA0KU29jLWlkIGFuZCByZXZpc2lvbiB3aWxsIHRha2UgY2FyZSB0
aGF0Lg0KDQo+IA0KPiBUaGUgInJlbmVzYXMsc21hcmMtZXZrIiBjb21wYXRpYmxlIGlzIG5vdCB0
aGUgbW9zdCBzcGVjaWZpYyBvbmUsIGJlY2F1c2UNCj4gZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25z
IGhhdmUgaXQuDQoNCkl0IGlzIGp1c3QgYSBjb21wYXRpYmxlIGZvciB0aGUgY2FycmllciBib2Fy
ZC4NCg0KPiANCj4gQWdhaW4gLSB5b3UgaW50ZW5kIHRvIHVzZSBhIHBhaXIgb3IgZXZlbiBhIHRy
aXBsZSBvZiBjb21wYXRpYmxlcyB0bw0KPiB1bmlxdWVseSBpZGVudGlmeSB0eXBlIG9mIGhhcmR3
YXJlLiBJIGRvbid0IHRoaW5rIGl0IGlzIGNvcnJlY3QgLSB0aGUNCj4gZmluYWwsIG1vc3Qgc3Bl
Y2lmaWMgY29tcGF0aWJsZSwgdW5pcXVlbHkgaWRlbnRpZmllcyB0aGUgaGFyZHdhcmUuIEFsbA0K
PiBvdGhlciBjb21wYXRpYmxlcyBhcmUganVzdCBmb3IgZmFsbGJhY2suDQoNClNlZSB0aGUgZXhh
bXBsZXMgd2UgaGF2ZSBkaXNjdXNzZWQuIEdlZXJ0IERvIHlvdSBhZ3JlZSB3aXRoIEtyenlzenRv
ZiBLb3psb3dza2kNClN1Z2dlc3Rpb24/DQoNCg0KSWYgd2UgaGF2ZSAyIGJvYXJkcyBCb2FyZC1h
IGFuZCBCb2FyZC1CIGJhc2VkIG9uIFNvQ1gNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KQ2FzZSAxOiBBcyBwZXIgeW91ciBleGFtcGxlIHdp
dGggZnJlZXNjYWxlLA0KDQpFbnVtDQogLSBCb2FyZC1hLVNvQ1gNCiAtIEJvYXJkLWItU29DWA0K
Q29uc3QNCiAtIFNvQ1gNCg0KQ2FzZSAyOiBvdXIgY2FzZQ0KRW51bQ0KIC0gQm9hcmQtYQ0KIC0g
Qm9hcmQtYg0KDQpDb25zdA0KIC0gU29DWA0KDQoNCklmIFNhbWUgYm9hcmQgdXNlZCBieSBkaWZm
ZXJlbnQgU29DJ3Mgb2Ygc2FtZSBTb0MgZmFpbHkNCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KDQpDYXNlIDE6IEFzIHBlciB5b3VyIGV4YW1wbGUgd2l0aCBmcmVlc2NhbGUs
DQoNCkVudW0NCiAtIEJvYXJkLVNvQ0ENCiAtIEJvYXJkLVNvQ0INCkVudW0NCiAtIFNvQ0ENCiAt
IFNvQ0INCkNvbnN0DQogLSBTb0MNCg0KQ2FzZSAyOiBPdXIgY2FzZQ0KRW51bQ0KIC0gQm9hcmQN
CkVudW0NCiAtIFNvQ0ENCiAtIFNvQ0INCkNvbnN0DQogLSBTb0MNCg0KQ2hlZXJzLA0KQmlqdQ0K
