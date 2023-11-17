Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51397EEA28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 01:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjKQAHv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 19:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKQAHu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 19:07:50 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB72EB8;
        Thu, 16 Nov 2023 16:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRFkaD0Zy5Ldq5jeRCFnKdcTNWbrufnlxQ1EPtzTWirTTXbWlbifj+9png1ySkxxO4eSCNFq58EOkyQ9s9nIcRoA+9nVF81Al88FcBIE5Qc7lh1wDWKAZp9cXljo0XDktK8QEjF44oreDnuCN/+jlHwkQ6OQDP35VMqhxwliLMnYIrNDOEYyDbNUBpZwgfjMzRvdaI2+2BUlvOlMDitKvgtKCz/KhyNnx1tS2wYTGFLX931haLTSEy2vGGYfJY9h3S7XgpIJdq1wx6hPAIiZo5GjumYwqhaKn2IoPE9jRQqYqFTlhFzUc/Nckb+JgYmqXTlLhIX2UPQdxjFVv0xtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdeD0WPTxPh9OSutZM4T96Nek1RjFqoQAML+vg44t9g=;
 b=dcvkZrJhYUzLh1YCcce/irdr/YXvCnK/TFYqwbvUNeqvErPrwNsY4b2/ZFb0TJkybB8ABTj9eb0c/46tFcm6YTpXYhGVZtvqDYxmrwYPUC4ZpQjN8cj/gEqLmzkhjlYFRXNUOFbAH7WMlOpxxI9Us0W4dy5+CVb59AW3NrKysPpbfMAlpPOyhZ+D1lLjA2/X712dwhRcO4Kq8a5Sr03NhUrTIJ8BFUrEppkQYIJvEu81/pp/kzPISNfBELm56/+/spu9MWWiGclmgrK4LsyBimjcBjYdQregCvkH2Co+GsdjwXPT7HsmqKQSR1CFq0sPl1bCQKpqBVsvF/64DmOY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdeD0WPTxPh9OSutZM4T96Nek1RjFqoQAML+vg44t9g=;
 b=agl01i6BxQ4dRXRfq9aiDWzieBIJC1SG67/yYfSNzr40Fo2m9XAgJo/eGVuLW6h8VPJJ8+RI44x0wyeEaoISyO7hUKdU3T9xgbCa0L0YS5HV1D5ELGZOlZ31ojyQGHMNVxWbRzzcd+YZt4ot2rZA/JUY3hu6KafMsEUYPrWi3hs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSYPR01MB5494.jpnprd01.prod.outlook.com
 (2603:1096:604:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 00:07:43 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 00:07:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaAoALb6SIWPIxUEiZAXqbN+NjubBRDKoAgCm+z2CAARNdAIAAWXCQgAEzYICAAF5T0A==
Date:   Fri, 17 Nov 2023 00:07:43 +0000
Message-ID: <TYBPR01MB5341FE9976E52CD8F6509B8ED8B7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
 <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
 <TYBPR01MB5341061AB0A805D0AF71FBB5D8B1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <69392d22-8ade-81aa-72b1-6a4abce8a4a7@omp.ru>
 <TYBPR01MB5341A4AE46EA9261469C735DD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <29603244-d65a-5ca0-90d4-fdd9f410e180@omp.ru>
In-Reply-To: <29603244-d65a-5ca0-90d4-fdd9f410e180@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSYPR01MB5494:EE_
x-ms-office365-filtering-correlation-id: 8dba1d4f-d5f1-4942-1b49-08dbe7013874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjCjv2COXQZ1FwOv8Dgohdwd7YPncx0x6lBg4HD3DzUMu+BFSi4MT3grsImBPG/DOkO+omLL+R9mgiKeFUv1I1EAeY4r5gCFJug/qngMmaup0UK/8fo7gGz/YD8L4u1SMdKnYswzVVD71+n0iKYglzEf2cllNr95kgTbbQoaWxQyC5YM8zW7pay6OUO97lZtwgnW5vmFTa929gliwIVX08roJ2LSxcSHiNThwZ7U/rycpfhvh+3uaOTZeLvWk0VeAGpL1pDnSnU5+WPJqFGzXugJwF+FL4OMcpmLuFP3aWgXxSHf+ijEM4Kfh1J+Rvry+jBXnLRT8sgdtCWac64IsiaN0rpVxuawqZPaYsO8Oh+L6O9SwB3S8ccpk1VG6gAa8xaWpQbe7vhXQz1Eciw3aOE+tJK0GKTsReU3BtI+aEsRK13FmQUb6D9qaFDPETgXc4qUWKt8d5Vb/72OzLghXoCcrQzxfqydOfH45/AXegFbm5udZNtwo034zrHLJQ5oNX/r09tSjFonZcku/pFj/8uBPBUfATTSj6/gXi1yeko5KktuYi2UHDjCBRcwXamncnyVUrlZARwPSEiCtsAIGVBfSzD2/vckHY1OWTe3e+sw2gYKcRIwNnq8IiEK0Osa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(41300700001)(38070700009)(71200400001)(110136005)(2906002)(5660300002)(83380400001)(52536014)(4326008)(122000001)(53546011)(8936002)(8676002)(64756008)(66476007)(54906003)(66446008)(66556008)(76116006)(33656002)(66946007)(6506007)(316002)(9686003)(7696005)(86362001)(38100700002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGNObTlnTHRQenBwdVF0MEpUelFsVm16VjVrZlN5WGYrVVYwSHJtRy9ZQk1D?=
 =?utf-8?B?MTV6WkUvTHFxNjIvK09pcWkyVkk4Z3M2dTNyai9sOERrc21mbk1uRnUwc00w?=
 =?utf-8?B?MG15TFBTeEhRTDBYekM2bWkvZEF2U29pOUpOdWFYeEdxTjF6ZDZ5aGI1ZDIv?=
 =?utf-8?B?dmltNEVLMlE0QzFQOUJLNC9rWDI1dlF1dlhSOWtsVjN6SjdRWEZudVY3UlF5?=
 =?utf-8?B?Z2Z5TGRQZ3IyWWlvVVFPVjdHZ3piMGNtLzZqVHE4aG41N0NnbFVyR2Q0ZlI3?=
 =?utf-8?B?R2Y2QzUxM09GWktXZ2RMQmFlMnNsbnBQalhTNlkrTE14UDE0S2dqMFVkcWxZ?=
 =?utf-8?B?OEVTczA0c2ZCSEVEWkIzM2w2cS9xc3FLQnM4cXZEM2RBWjI1MUIxUFNQTi9I?=
 =?utf-8?B?OTAyczZGR0VOM01vU1VvbE43SnV5emt5MlRacXBteXJpZzFtR0svdWVDcWJu?=
 =?utf-8?B?UFVwWlJXL3ZNNnlZV1VLY0tOaTFhNlUrUkk2NXNMT3hzbk91ckM2WWNoRjFW?=
 =?utf-8?B?QVl2STNPR1JCcGlHUkJ1aHR4ckd1OWkvUCsvdkZwQ0p0ZXRNdGQvNFJqQXph?=
 =?utf-8?B?VVFwQ2UyL1MzSm0ydE9lbVNmVTBNbHE2Yi9WcWRab0FndTdtcCt4dlNLaXlD?=
 =?utf-8?B?MCsyYUhLa0pxRU1xdDYyTTg5VkZkQzh5WTU3REcrelczOGpvQkRvaXdoVndt?=
 =?utf-8?B?RWwrY294SUN2cEpZYkRvdWZmSDRITFMrTHhxZmlwOVlOMy9BMFkzcVFjdDhz?=
 =?utf-8?B?T1cyczZsQXhHZUMwUHcrenBnTTd1YkNmdVQrOVkzK3pNR0ljNXM5YkcwbXd0?=
 =?utf-8?B?bmZ0RTZZZ2k2VlpHVXJCclMxWDU5YTRNeW53Q3JTaVZvSDBBUGVvT3hyeFV5?=
 =?utf-8?B?TWNEdkV2RzdMMzBmZEVRKzVxQnN5KzNhTE56ZS9McXRuNFVLSit1MTBwbFUy?=
 =?utf-8?B?bnJmdVlpUmpMVUFyVkNHcDVKSWJZak52Q0lzNDBadlAvMUtHSms4aWUvTFVD?=
 =?utf-8?B?OHJiVHlpVU5KN20wR3lzOFNjT0JoMXo5SjNLbTFIaWp3Nkp4My94R00zbkpj?=
 =?utf-8?B?Q25XRk8zemdKazBsblBRV0hHLzEwMDNCVzA5bGU3bmhZTDJQemx3dFZYVHlZ?=
 =?utf-8?B?S3owVkdiR3o2MHZvVktXUm8za3RuSnZmU3MvZFl3Vy80SE9BeWh2dnJCTUFJ?=
 =?utf-8?B?OVRGWU5SMVRlemN6WjRJdjZwZGloamZ0TXRMdzdJTGl0VmVoUG5nT3RWYytG?=
 =?utf-8?B?NnZob0VGdmV5YU5IaE5hejNxNVVGNHl3cFRoZTFGQ3lBNXdjSmdYQlJGYTBT?=
 =?utf-8?B?VjRkWUErS0RHM2VNZFdTNlBGYWF2eXkzaXY2YXBFQnozOWx6U0hnNEJjVTRQ?=
 =?utf-8?B?L296dG5vOVBCVWxFdEJqUGZKNTJsS0dLQU1kV21QU2FwUElya3R2cjc2a1pQ?=
 =?utf-8?B?UEtISXZDQUxyM1luOWF5WjVlVkVjQVZkelpMaG1CVGVUdGlCZm9DZHUwbjAy?=
 =?utf-8?B?bk01UkcrYkVQTE8xSFpIc1dHeUk1QUxpK05MRThvWFpNYUZyaTQ0b3AwY0Vi?=
 =?utf-8?B?K1V4YjJHaGhnNTB5S3NOclVHZEtkUUMxUUhETC9nTVpQZHVMVkNHdjlHSGNJ?=
 =?utf-8?B?WU45UU0zaGpzK2k2OHFLTWd1alZ6WndRSGlES2RaZEJGZ1d0cXhXNlpnVDM5?=
 =?utf-8?B?Rit2amwySm5hckVHSlplR3V6eXZHK1FUeGtCbHkzSDE0N2JvakRoNEt2d3Zx?=
 =?utf-8?B?a0UralJHbWxzYWtnalV5RERVT3NKcHUrR2ViWXhIWm9CNE5nWmF2VnVPR0RC?=
 =?utf-8?B?aXB2V2lKc2svUWJUemhDUjlic25KMjE1U2pyN3ViZjZuT1dqcmdwL1l2WC9C?=
 =?utf-8?B?TDgvTS9Cd3lCWW1CUWlKeGVXaFZxdk9LRnJ4czVnaEdxS3U2OWplZnZqS3Y4?=
 =?utf-8?B?dDIxSnRkKzcranlLcThtY2wvUk5CRmJtRmVxUWliOUpYMnFab2ZUTGlYTTF6?=
 =?utf-8?B?MldmZHFiZWhHZDFISHhzdERrYUxoTXZ3UnY4N2MyZmZmZXY4bGx5djA3SUJE?=
 =?utf-8?B?MGh0a0dZT25xYWhObmp0MUV4S2RTdXhXMG9iVzNMS1hrS2tyd0dCUmd3UmhC?=
 =?utf-8?B?dmZPSXp4TWc0aUtyMkE2d1ZtTWFMeDR3dVpKOGh1RmVtaTVOVWh6cDMvZENl?=
 =?utf-8?B?RzhRQVQvNkVUMEJiVzhYN2RIck55YWNGbFlHZHdxTHJXRmpHcThsVGlXVkRm?=
 =?utf-8?B?TE94Mmhwd1VOcUZ4SU9JOGwzTldBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dba1d4f-d5f1-4942-1b49-08dbe7013874
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 00:07:43.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yEpIlBtkpv6DYZVy3ldf8Rv2VgSk4OVGRt8IjBaK10hW/RPCA65lD31ay8DRpyEREZmZO9dslf6VwlHN+XaICiCv2jOOEdNj7XYmah1RtI9qII4w3NkNlkHiWMghHSz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5494
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YsIFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTcsIDIwMjMg
MzoxMiBBTQ0KPiANCj4gT24gMTEvMTYvMjMgNToxNSBBTSwgWW9zaGloaXJvIFNoaW1vZGEgd3Jv
dGU6DQo+IFsuLi5dDQo+IA0KPiA+Pj4+PiBGaXggcmFjZXMgYmV0d2VlbiByYXZiX3R4X3RpbWVv
dXRfd29yaygpIGFuZCBmdW5jdGlvbnMgb2YgbmV0X2RldmljZV9vcHMNCj4gPj4+Pj4gYW5kIGV0
aHRvb2xfb3BzIGJ5IHVzaW5nIHJ0bmxfdHJ5bG9jaygpIGFuZCBydG5sX3VubG9jaygpLiBOb3Rl
IHRoYXQNCj4gPj4+Pj4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBydG5sIGxvY2sg
YW5kIGNhbGxzIGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPj4+Pj4gcmF2Yl90eF90aW1lb3V0X3dv
cmsoKSBzaG91bGQgY2FsbHMgcnRubF90cnlsb2NrKCkuIE90aGVyd2lzZSwgYSBkZWFkbG9jaw0K
PiA+Pj4+PiBtYXkgaGFwcGVuIGluIHJhdmJfdHhfdGltZW91dF93b3JrKCkgbGlrZSBiZWxvdzoN
Cj4gPj4+Pj4NCj4gPj4+Pj4gQ1BVMAkJCUNQVTENCj4gPj4+Pj4gCQkJcmF2Yl90eF90aW1lb3V0
KCkNCj4gPj4+Pj4gCQkJc2NoZWR1bGVfd29yaygpDQo+ID4+Pj4+IC4uLg0KPiA+Pj4+PiBfX2Rl
dl9jbG9zZV9tYW55KCkNCj4gPj4+Pj4gLy8gVW5kZXIgcnRubCBsb2NrDQo+ID4+Pj4+IHJhdmJf
Y2xvc2UoKQ0KPiA+Pj4+PiBjYW5jZWxfd29ya19zeW5jKCkNCj4gPj4+Pj4gLy8gV2FpdGluZw0K
PiA+Pj4+PiAJCQlyYXZiX3R4X3RpbWVvdXRfd29yaygpDQo+ID4+Pj4+IAkJCXJ0bmxfbG9jaygp
DQo+ID4+Pj4+IAkJCS8vIFRoaXMgaXMgcG9zc2libGUgdG8gY2F1c2UgYSBkZWFkbG9jaw0KPiA+
Pj4+Pg0KPiA+Pj4+PiBGaXhlczogYzE1NjYzM2YxMzUzICgiUmVuZXNhcyBFdGhlcm5ldCBBVkIg
ZHJpdmVyIHByb3BlciIpDQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2Rh
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPj4+Pg0KPiA+Pj4+IFJldmll
d2VkLWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pg0KPiA+Pg0KPiA+PiBb
Li4uXQ0KPiA+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWlu
LmMNCj4gPj4+Pj4gaW5kZXggMGVmMGI4OGI3MTQ1Li4zMDBjMTg4NWUxZTEgMTAwNjQ0DQo+ID4+
Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPj4+
Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+Pj4+
PiBAQCAtMTg3NCw2ICsxODc0LDkgQEAgc3RhdGljIHZvaWQgcmF2Yl90eF90aW1lb3V0X3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+Pj4+PiAgCXN0cnVjdCBuZXRfZGV2aWNlICpu
ZGV2ID0gcHJpdi0+bmRldjsNCj4gPj4+Pj4gIAlpbnQgZXJyb3I7DQo+ID4+Pj4+DQo+ID4+Pj4+
ICsJaWYgKCFydG5sX3RyeWxvY2soKSkNCj4gPj4+Pj4gKwkJcmV0dXJuOw0KPiA+Pj4+DQo+ID4+
Pj4gICAgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIHJlc2NoZWR1bGUgdGhlIHdvcmsgaGVyZS4uLg0K
PiA+Pj4NCj4gPj4+IEkgdGhpbmsgc28uIEJ1dCwgaXQgc2hvdWxkIHJlc2NoZWR1bGUgdGhlIHdv
cmsgaWYgdGhlIG5ldGlmIGlzIHN0aWxsIHJ1bm5pbmcgYmVjYXVzZQ0KPiA+Pj4gVXNlLWFmdGVy
LWZyZWUgaXNzdWUgaGFwcGVucyBhZ2FpbiB3aGVuIGNhbmNlbF93b3JrX3N5bmMoKSBpcyBjYWxs
aW5nLiBBbHNvLCBJIGFsc28gdGhpbmsNCj4gPj4+IHdlIHNob3VsZCB1c2Ugc2NoZWR1bGVfZGVs
YXllZF93b3JrKCkgaW5zdGVhZC4gU28sIEknbGwgc3VibWl0IHN1Y2ggYSBwYXRjaCBhcyB2My4N
Cj4gPj4NCj4gPj4gICAgSSdtIG5vdCByZWFsbHkgc3VyZSBhYm91dCB0aGF0IG9uZS4gTm90ZSB0
aGF0IGNhbmNlbF93b3JrX3N5bmMoKSBzaG91bGQNCj4gPj4gd29yayB3aXRoIHRoZSB3b3JrcyBy
ZXF1ZXVlaW5nIHRoZW1zZWx2ZXMsIHRoZSBjb21tZW50cyBzYXkuLi4NCj4gPg0KPiA+IEknbSBz
b3JyeSwgSSBjb21wbGV0ZWx5IG1pc3Rvb2sgdG8gZXhwbGFpbiB0aGlzLi4uIEkgc2hvdWxkIGhh
dmUgc2FpZDoNCj4gDQo+ICAgIERvbid0IHdvcnJ5LCBteSB1bmNlcnRhaW50eSB3YXMgYWJvdXQg
dXNpbmcgdGhlICJkZWxheWVkIiBmbGF2b3Igb2YNCj4gdGhlIHdvcmtzLiA6LSkNCj4gDQo+ID4g
SXQgc2hvdWxkIG5vdCByZXNjaGVkdWxlIHRoZSB3b3JrIGlmIHRoZSBuZXRpZiBpcyBub3QgcnVu
bmluZyBiZWNhdXNlDQo+ID4gICAgICAgICAgIH5+fiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB+fn4NCj4gPiB1c2UtYWZ0ZXItZnJlZSBpc3N1ZSBoYXBwZW5zIGFnYWluIHdo
ZW4gY2FuY2VsX3dvcmtfc3luYygpIGlzIGNhbGxlZCBmcm9tIHJhdmJfcmVtb3ZlKCkuDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiAgICBXZWxsLCBpdCdzIGNhbGxl
ZCBmcm9tIHJhdmJfY2xvc2UoKSAtLSB3aGljaCBpcyBjYWxsZWQgYnkgdGhlIG5ldHdvcmtpbmcN
Cj4gY29yZSB3aGVuIHVucmVnaXN0ZXJfbmV0ZGV2KCkgaXMgY2FsbGVkIGJ0IHJhdmJfcmVtb3Zl
KCkuLi4NCg0KWW91J3JlIGNvcnJlY3QuIEknbSBzb3JyeSBmb3IgbXkgbGFjayBleHBsYW5hdGlv
biBhZ2Fpbi4uLg0KDQo+ID4gQWxzbywgSSBjb21wbGV0ZWx5IG1pc3VuZGVyc3Rvb2QgdGhlIGJl
aGF2aW9yIG9mIGNhbmNlbF97c2NoZWR1bGVffXdvcmtfc3luYygpLg0KPiANCj4gICAgY2FuY2Vs
X3tkZWxheWVkX313b3JrX3N5bmMoKSwgeW91IG1lYW50Li4uDQoNClllcy4uLg0KDQo+ID4gSW4g
dGhlIGZ1bmN0aW9uKHMpLCBzaW5jZSBXT1JLX1NUUlVDVF9QRU5ESU5HX0JJVCBpcyBzZXQsIHNj
aGVkdWxlX3tkZWxheWVkX313b3JrKCkNCj4gPiB3aWxsIG5vdCBzY2hlZHVsZSB0aGUgd29yayBh
bnltb3JlLiBTbywgSSdsbCBkcm9wIGEgY29uZGl0aW9uIG5ldGlmX3J1bm5pbmcoKQ0KPiA+IGZy
b20gdGhlIHJhdmJfdHhfdGltZW91dF93b3JrKCkuDQo+IA0KPiAgIEhtLCB0aGlzIGNhdXNlZCBt
ZSB0byBydW1tYWdlIGluIHRoZSB3b3JrIHF1ZXVlIGNvZGUgZm9yIG1vcmUgdGltZSB0aGFuDQo+
IEkgY291bGQgYWZmb3JkLi4uIHN0aWxsIG5vdCBzdXJlIHdoYXQgeW91IG1lYW50Li4uIDotLw0K
DQpJJ20gc29ycnkgZm9yIGJvdGhlcmluZyB5b3UgYWJvdXQgdGhpcyB0b3BpYy4uLg0KSW4gdGhl
IHYzIHBhdGNoLCB0aGUgcmVzY2hlZHVsaW5nIGNvZGUgd2FzOg0KLS0tDQorCWlmICghcnRubF90
cnlsb2NrKCkpIHsNCisJCWlmIChuZXRpZl9ydW5uaW5nKG5kZXYpKQ0KKwkJCXNjaGVkdWxlX2Rl
bGF5ZWRfd29yaygmcHJpdi0+d29yaywgbXNlY3NfdG9famlmZmllcygxMCkpOw0KKwkJcmV0dXJu
Ow0KKwl9DQotLS0NCg0KSG93ZXZlciwgd2UgY2FuIGltcGxlbWVudCB0aGlzIGxpa2UgdGhlIGZv
bGxvd2luZzoNCi0tLQ0KKwlpZiAoIXJ0bmxfdHJ5bG9jaygpKSB7DQorCQlzY2hlZHVsZV9kZWxh
eWVkX3dvcmsoJnByaXYtPndvcmssIG1zZWNzX3RvX2ppZmZpZXMoMTApKTsNCisJCXJldHVybjsN
CisJfQ0KLS0tDQoNClRoZSBzY2hlZHVsZV97ZGVsYXllZH1fd29yaygpIHdpbGwgbm90IGJlIHF1
ZXVlZCBhZnRlciBjYW5jZWxfe2RlbGF5ZWRffXdvcmtfc3luYygpDQp3YXMgY2FsbGVkLCBiZWNh
dXNlIFdPUktfU1RSVUNUX1BFTkRJTkdfQklUIHdhcyBzZXQgaW4gY2FuY2VsX3tkZWxheWVkX313
b3JrX3N5bmMoKQ0KbGlrZSB0aGUgZm9sbG93aW5nOg0KLS0tDQpjYW5jZWxfd29ya19zeW5jKCkN
Ci0+IF9fY2FuY2VsX3dvcmtfdGltZXIoKQ0KICAtPiB0cnlfdG9fZ3JhYl9wZW5kaW5nKCkNCiAg
IC0+IGlmICghdGVzdF9hbmRfc2V0X2JpdChXT1JLX1NUUlVDVF9QRU5ESU5HX0JJVCwgLi4uKQ0K
DQpzY2hlZHVsZV93b3JrKCkNCiAtPiBxdWV1ZV93b3JrKCkNCiAgLT4gcXVldWVfd29ya19vbigp
DQogICAtPiBpZiAodGVzdF9hbmRfc2V0X2JpdChXT1JLX1NUUlVDVF9QRU5ESU5HX0JJVCwgLi4u
KQ0KICAgIC0+IF9fcXVldWVfd29yaygpDQotLS0NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJv
IFNoaW1vZGENCg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBZb3NoaWhpcm8gU2hpbW9kYQ0KPiBb
Li4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==
