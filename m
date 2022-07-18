Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B764578634
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 17:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiGRPYO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 11:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbiGRPYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 11:24:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B8A286DE;
        Mon, 18 Jul 2022 08:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8LsezJes8an/TVmsErkTiy3ku9l3/Lhm9CiAm+UwvwygaEvxPAyfdw1BSOL4cPzfVMPqpgK+ZS3u9CdPaiCurREQJlazkmESHoFFI7TMO0PB4685SM3XP6ZfO3L2iAp6R1L27v1LlXQVbWGcChuRfDTkXGrqJO/eIR4tdXq9/Oq+NTufiMnfc/+a6NC1BHGmW3hQSi+KS27KvGsEacg/GljwCOPxXRpFTKg523IeYt4DyH6pSsI6tnF0KGj0dwTNTreJcOotDwvwfqgzFoiiZX3Oiez9/fYilD3QO2HvamSy8Nw4OUbgIGGkoC46MOgMGIgFognNOcu7mv8s5WgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29NB2gZ/hIQT0z6NGAOAZc50h9vPX7bmu6U7k4MSmuQ=;
 b=PsxvlVWt6h2sSYLwrCMg8ztCM6nRk1bmXGd7mjrE6jLCDCbWRXexjJJKeIksriDQhZ2yVMUIEn497groVmfIdiRo4uDPxgdw2lejSwu6PlsT+4eCKYcNln/BjzEmVqLHSjwHLgoixm09lSBiGJZav3umQNBD7vo0YQeyqiMvhRupLL0Xmscxk9PFX2ENlL6EhHTl+5n19S8ys2gvv0/e1q70x6Ft+hFg+eoiVaNBSu0tGpfJSl9gsMwOeo7GgbDn/eoGihGjRsvV++UNadHBeUhS7UGleBEcu2f5CDmJEvFBE3hxTK62LD8JmAa8/zYJJOzuK0qzTBRUeBzdY4UpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29NB2gZ/hIQT0z6NGAOAZc50h9vPX7bmu6U7k4MSmuQ=;
 b=MerHO2lQqnrxVL3sepb3URgiuqovb/nkkNZS+iw9l/oqHABENXFBf/7FLwwhXhjajbOK9OxjDbysgrIxjMu/mXxJOQGrmmIvNsFJj8OFBAVBRFQP4g6y4/Tg9ujvVVAxs9k/62AuLQ0w2c50MSWT6xzhkE4du62iOBU2CPQm+Sg=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB6679.jpnprd01.prod.outlook.com (2603:1096:604:ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 15:24:07 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:24:07 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
Thread-Topic: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document
 RZ/V2M r9a09g011 support
Thread-Index: AQHYmqydoo0CM3aRukCI8TxnX3l0a62EJpuAgAATSeA=
Date:   Mon, 18 Jul 2022 15:24:07 +0000
Message-ID: <TYYPR01MB70868B846CAB2F7124148771F58C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-2-phil.edworthy@renesas.com>
 <40224cd7-0e71-7f5a-47c8-142539312f21@linaro.org>
In-Reply-To: <40224cd7-0e71-7f5a-47c8-142539312f21@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0540e20d-865b-4502-1c27-08da68d18e5a
x-ms-traffictypediagnostic: OSZPR01MB6679:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UcabkrDJQiM//0Is+ROX3I4zBldQ/fo0qsvFq723DXnswTDUVdgc4OuUD9N95/G8RjEHufzYPwwVhpNZSsFWzWs/K+Rho9A9sLsyfsbr61L8jdJ+QGy9lmaJQ0dhVAYQNIZNqK1s30jWCLoIrFe/Sg3uurOOyIJuBtmn5mPGwOex17g6WRftLHOnDfIrXwZeOZ4ONSQJFhsr1rt+rHGs9vkG2Wv3tkARhkC1DN3oQw+oapbEHBVtez845BBEl9W9SjlInpFo7csQsHs4Czsak891ZCPeRv8HpBBCTQiJ026HWl4ccj5vDiIkQX0WBlPcSRLbwtoHHx1IceGNhg9aRooq4TKfCNsssadUJvU56Hfi+7bo+7/YzOls/TbxysXlQ3CM3jjMZHY8zbjPbYXCXIJTQA/vZEUmodMp+Ghzs5VJkeoSxSw/CS8Z7oXXMjTI1Vvy8KadaGvPhPRnS/dhsCKrv974g/MDV9gkk8ILmlmGIWso3DhzGWjRvft2v5iuzv62zVHU/AynYfsz8NXKUR+h5QohXlWPVGEM3RN7+7pQ0hRPIGcZ5eWm4IfWcuDCJR1rYJUrN/a37SgDke3zqLJ3fuylBmAG16JGRnJMRagKfsUgwOw+A4jj2r8DWZg8EguIr+lDE3qP3oywpeV7BE0t9nxmDuMbaGNwAO5eprnOo7heYVgQKkI8hXY6CIeHxHE8Hx+zXj+6Uat5B1Mf2bPhl0p6YLQl+zr7balP62H1fora/WHQ7gy5cRBsPjr5H4WzJFqRkFja/2rcW8xTWX4nqQyOpdBFELvn4+ojkYRrMy5LgNLsvgTIDxuB+iNw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(41300700001)(2906002)(107886003)(6506007)(7696005)(53546011)(66556008)(316002)(66446008)(38070700005)(54906003)(66476007)(64756008)(44832011)(38100700002)(122000001)(66946007)(110136005)(76116006)(8936002)(86362001)(55016003)(83380400001)(33656002)(71200400001)(8676002)(4326008)(5660300002)(26005)(9686003)(186003)(52536014)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEE1ZWFKWUhDMnZaMnBxeUN3RDVseUdTUHN5YUszK2V6Tmxkb0FhVnBSTXRx?=
 =?utf-8?B?aHgxdmdGUnVCWTFyM25OYnY1RjNhUTE0ZDVuVkV3K3VKVzZNWjdHNnE0RGJa?=
 =?utf-8?B?TlV2TnJoRTNFYUI1MjF1a3lvME00dWdLQjZUbE1VakRIYmF2SkV4cGZ4cys4?=
 =?utf-8?B?S2YvbFA3VTFwZGxrZk9rTWc2Y3lWWDR6Vm55dHhvT0pWVG5IeVBqZ0w0cHph?=
 =?utf-8?B?NXE0aVNTUml3RjVGSWJyYWo3eU1FWmxkYkdxd2V2NzJRbHlBMFpDVFhTMW9H?=
 =?utf-8?B?Z2ZsWUlOY0kxdFhNVmcxYnU0QjJoVWd6YVJqaC9MWVpFTEF1cXBYSDlzREEy?=
 =?utf-8?B?ZWJHRlBsNFZmVERncE5uQVBkVXBpeEJYUTk5cTdqSHVMZ0pVZm8wdTU5VDYz?=
 =?utf-8?B?YlVmaHhXaCtndmdPeXR6cHFVcjF4WFd0akRLc0YxbGQvY21vOW9FajhYTU90?=
 =?utf-8?B?OUkxYlRjOVNwekt3d2VUOXJtS24yTTU3MGMySm5TWS9QOGQ5SHZ0NVhZNmRn?=
 =?utf-8?B?MnRSUlhwcWRaVDJqdkR3TDU4UjFoUHU0OHd1L3RFTWtMOUIvT09IVTlXalhD?=
 =?utf-8?B?MFhVSkN2Z0g3eG9zWlJLUHZ4YUg5ZGZockhGM2tzaXBKS0hNT3FBRUt1dXFu?=
 =?utf-8?B?cUJXLzFrQ2F2K3MrVlpCM3ovQ1NEeHpUNTJCdkU0MTRvdXBuTERSODJDVytF?=
 =?utf-8?B?SHphT3U0U3l1NUJlRml2RkN5OVFjUXVmMWcvek9KZ0dmU0x4TzFiaGl4RDM4?=
 =?utf-8?B?emxESHA1eStmMDVheXJRZDUvMXNZMGxiUUFGOWlWUXBGci9vcEoyaVpQVWVt?=
 =?utf-8?B?N3hmRmZnajNFWGVqRkRyeURsSHA5VHVySWhWYWdrTmppUFBqT2xkVWRyT1dv?=
 =?utf-8?B?Y240c0svTklxQWRRWDFFZ0NZSHdKMFl6U21PQitBNzRIZ2Q4SlJGa2dJcTE5?=
 =?utf-8?B?MnBKclFLUU5iVGFiMElza3ljM3ZDQ2x0NnU0Rnh3SGt1dVpYWjJrbDdMZU5R?=
 =?utf-8?B?VkY4S3lreW1wTXRPKzNmZ3IrZE5lZjFnZ1JZOEthRTlkWjJzaFBteW50QTht?=
 =?utf-8?B?TlpreXNWKzRlRzBjOUIxaTByVjAvTTcweEh0aklBeDZhTGE5a3NjS3BEQUJG?=
 =?utf-8?B?M3B4cnhRVi9uMEt6M0ptamtTSUF6VHNIbmlWeTRRRXBsby9OR0dOQUhjc0xy?=
 =?utf-8?B?SzNKTFFaUWloeEFZdmR3WjZveEtmeEk4ME1lRGc3dWNNbURYaU90YXFWME1U?=
 =?utf-8?B?SHowQmZRYmhqTkpIS2JHQnhMRTVTZVg4a1puRjN6cXA2OWlybnpQTjg4QVpj?=
 =?utf-8?B?d1owL1A5WWh0dG5INlo3aWpQc1pnMmJpT0ZSSk1jcHc0S0RmRXRsRmdQNkh3?=
 =?utf-8?B?Ly9wcXZjSGptSUVBSldEOCtVY1ZFemlDcmwxbUErRUZiUnRIV0QrMXZmZjFX?=
 =?utf-8?B?OERJOUc5N1NJRkh2UkM3RXIyRm5oR0s0L2JuZ3lXb3kvWHJ2M1ZvSHRiTE5C?=
 =?utf-8?B?MFVjaXkrbEQ4WjJnZGJTek9BMExaalBuRkE3QjRwUTZ2UitwYmdWaGhuZFNN?=
 =?utf-8?B?UkZ1ZkI3cWZQSnN6ZW8zSnJxbFg4YWRxUmJPemxNUG1DeEdSMEw1Tmg2alVJ?=
 =?utf-8?B?ZzlkQTZYNDRHaGZpSGt4bUFKb1VqVzFpTTk5bStNbkd2cFA4bzA0LzB0ZzFJ?=
 =?utf-8?B?Qmo3Wm4yaDdlakdWNlJRK1VwKzNSWjhRdmtsa0ZmUloyRDY4QTh4WlhwWlJB?=
 =?utf-8?B?dnV3c1dnTHpKVXN1aHAva0RqcXFwNU5BN1QvRUNaQ1piYTljZVpKSU92VDdJ?=
 =?utf-8?B?T1JDVytRdEdLOVI0UDdvRVBRMExjSXUxOWc3ZUF3RVBPd1g5Q0lBaTB5UnNN?=
 =?utf-8?B?SlhrbVU4WkpnMmxVUTBpZFROQ082NWNTTFlCV0RZWWR4TlN1ckxzamhLMmda?=
 =?utf-8?B?ZjZ1UWtIUnVsd0xseDRPZWFQdm1JVE9NNkh1OFpnV3ZYQXFBK3Qrc1BRWDUx?=
 =?utf-8?B?aS90ZUFKMDV5SFNUT08waWNvdU5FNWJiSzVDeWl0UENiUGtsL2gxeDR6WFhq?=
 =?utf-8?B?dU8xWldOVDZoWlRQZ2Z0RTluRk1tbE5ub0ZwKzFWQUduOUhwMlFGRUxOUTE4?=
 =?utf-8?B?cTJZUzZDbWsvZTJUdExCTllOclBWUDFEUnovaFVyeFo0ZnVLaFpqL0IxdkZ2?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0540e20d-865b-4502-1c27-08da68d18e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 15:24:07.1913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkAI+QUBIkFbwRrEc+/NJuy2ViBg4CGK9CPEum3xPRDWPyNGadcNIqO9TowNnZBC6iUM8x34kF5R9GpgMctFKVmOTWoAiRatLRxAD2UC4CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6679
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQ0KDQpPbiAxOCBKdWx5IDIw
MjIgMTQ6NTUgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMTgvMDcvMjAyMiAxNTo0
NCwgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiBEb2N1bWVudCB0aGUgUlovVjJNIFNvQyBiaW5k
aW5ncy4NCj4gPiBUaGUgUlovVjJNIFNvQyBpcyBhIGxpdHRsZSBkaWZmZXJlbnQgdG8gdGhlIFIt
Q2FyIGltcGxlbWVudGF0aW9ucy4NCj4gPiBBIGZldyBEUkQgcmVsYXRlZCByZWdpc3RlcnMgYW5k
IGJpdHMgaGF2ZSBtb3ZlZCwgdGhlcmUgaXMgYSBzZXBhcmF0ZQ0KPiA+IGludGVycnVwdCBmb3Ig
RFJELCBhbiBhZGRpdGlvbmFsIGNsb2NrIGZvciByZWdpc3RlciBhY2Nlc3MgYW5kIHJlc2V0DQo+
ID4gbGluZXMgZm9yIERSRCBhbmQgVVNCUC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwg
RWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Jp
bmRpbmdzL3VzYi9yZW5lc2FzLHVzYjMtcGVyaS55YW1sICAgICAgIHwgODEgKysrKysrKysrKysr
KysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9yZW5lc2FzLHVzYjMtDQo+IHBlcmkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvcmVuZXNhcyx1c2IzLXBlcmkueWFtbA0KPiA+IGluZGV4IDlm
Y2Y1NGIxMGIwNy4uMjhmNzg1ZGQyMDEyIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcmVuZXNhcyx1c2IzLXBlcmkueWFtbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcmVuZXNhcyx1c2IzLXBlcmku
eWFtbA0KPiA+IEBAIC0xMSwyNyArMTEsNDkgQEAgbWFpbnRhaW5lcnM6DQo8c25pcD4NCg0KPiA+
ICAgIGludGVycnVwdHM6DQo+ID4gLSAgICBtYXhJdGVtczogMQ0KPiA+ICsgICAgbWluSXRlbXM6
IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDb21iaW5lZCBp
bnRlcnJ1cHQgZm9yIERNQSwgU1lTIGFuZCBFUlINCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
RHVhbCBSb2xlIERldmljZSAoRFJEKQ0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHQtbmFtZXM6DQo+
IA0KPiBtaW5JdGVtczoxDQo+IA0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6
IGFsbF9wDQo+ID4gKyAgICAgIC0gY29uc3Q6IGRyZA0KPiA+DQo+ID4gICAgY2xvY2tzOg0KPiA+
IC0gICAgbWF4SXRlbXM6IDENCj4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gKyAgICBpdGVtczoN
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogTWFpbiBjbG9jaw0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBSZWdpc3RlciBhY2Nlc3MgY2xvY2sNCj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6
DQo+IA0KPiBtaW5JdGVtczoxDQo+IA0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29u
c3Q6IGFjbGsNCj4gPiArICAgICAgLSBjb25zdDogcmVnDQo+ID4NCj4gPiAgICBwaHlzOg0KPiA+
ICAgICAgbWF4SXRlbXM6IDENCj4gPiBAQCAtNDMsNyArNjUsMTUgQEAgcHJvcGVydGllczoNCj4g
PiAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAgICByZXNldHM6DQo+ID4gLSAgICBtYXhJdGVt
czogMQ0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBQZXJpcGhlcmFsIHJlc2V0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IERSRCByZXNldA0KPiA+ICsNCj4gPiArICByZXNldC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0K
PiA+ICsgICAgICAtIGNvbnN0OiBhcmVzZXRuX3ANCj4gPiArICAgICAgLSBjb25zdDogZHJkX3Jl
c2V0DQo+ID4NCj4gPiAgICB1c2Itcm9sZS1zd2l0Y2g6DQo+ID4gICAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnDQo+ID4gQEAgLTc4LDYgKzEwOCwyNyBAQCBy
ZXF1aXJlZDoNCj4gPiAgICAtIGludGVycnVwdHMNCj4gPiAgICAtIGNsb2Nrcw0KPiA+DQo+ID4g
K2FsbE9mOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAg
ICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyenYybS11c2IzLXBlcmkNCj4g
PiArICAgIHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY2xvY2tz
Og0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gPiArICAgICAgICBpbnRlcnJ1cHRzOg0K
PiA+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gPiArICAgICAgICByZXNldHM6DQo+ID4gKyAg
ICAgICAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAt
IGNsb2NrLW5hbWVzDQo+ID4gKyAgICAgICAgLSBpbnRlcnJ1cHQtbmFtZXMNCj4gPiArICAgICAg
ICAtIHJlc2V0cw0KPiA+ICsgICAgICAgIC0gcmVzZXQtbmFtZXMNCj4gDQo+IGVsc2U6DQo+IG5h
cnJvdyB0aGUgbnVtYmVyIG9mIGl0ZW1zDQpTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3
ZSBuZWVkIG1pbkl0ZW1zOiAxIGZvcg0KaW50ZXJydXB0LW5hbWVzL2Nsb2NrLW5hbWVzLCBidXQg
dGhlbiBJJ20gZWFzaWx5IGNvbmZ1c2VkIQ0KDQpOb25lIG9mIHRoZSBleGlzdGluZyB1c2VycyBo
YXZlIGFueSBpbnRlcnJ1cHQtbmFtZXMvY2xvY2stbmFtZXMNCmhlbmNlIHRoZXkgYXJlIG5vdCBp
biByZXF1aXJlZC4gVGhlIHJ6djJtIGlzIHRoZSBvbmx5IGRldmljZQ0KdGhhdCBuZWVkcyB0aGVt
IHNvIHRoZSBkcml2ZXIgY2FuIGdldCB0aGVtIGJ5IG5hbWUsIGFuZCBoZW5jZQ0KaXQgc2V0cyBt
aW5JdGVtczogMg0KDQpUaGFua3MNClBoaWwNCg==
