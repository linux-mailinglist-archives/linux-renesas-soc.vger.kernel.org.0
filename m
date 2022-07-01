Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49827562FA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 11:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbiGAJPG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 05:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbiGAJPF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 05:15:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E6A45784
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 02:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU9WYR4kELuaFRAPZqPzrZNHtQ8TkQNi3quh3/kpPi8ultqHnmVDaZ381O9lkmV4XischY94Hqi9z1Vm3WMPeIRKG3vo1AftlulNnvOYegsNtSE5e9lAQsWizNuYNUPfJMU412gp1xc+Ns9LUMVnjHvRb91N2ulOvS6iApw291n2rTWSZsqMaBMHVMBzDZCaeO1Cs9y3aJ+KHDY4qFg6GtFRXgJIwnMuin68axKJNbptlvbpwAXalYq99Gazw301FpCepebkPZAgTzGNkat3WUOcrmHAZGrA5ddqZdTLrcBybRkqJXsc1ob2I8z5NzUCQxFy6cr/oFyaNm65uiuA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1Irk2n6ZpM/NI+6pRdLKSeWeWrTk6UL4anYbQh5FA8=;
 b=WTQ9bOvkKHHOx8r9smXs5a/sYMWGkycZvmlWnrCmFGurugVkqYMM1OeXD8wC9++CUeWD47/FwXboHnQY6yIqRHzwlkSjuOAEMRnAR6MJp90cvQQgeMkyREVROOzlSQGAnxrDpPIBx5IqkeHGvcFlMu9dcNdgMmQ5TTyzDIHaR46E8UNEBySHlo8NBZI9eYnAeI74LiuJwelkMV7G+LiszLhif88RmxBdfwNfUy57STsBviNnMUNM3CmbcxwprwWL0rP28ek4LlwTeoaBx1K/MLlpvZlvucj3q5Xy/I4MWqa+lnelZYnCul8RIss3UDiHBgT2Fv6Xm5rYtZRlqZyO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1Irk2n6ZpM/NI+6pRdLKSeWeWrTk6UL4anYbQh5FA8=;
 b=LPHoUNbeGn4Lr9e1xo0TDcY9ySFiqV7wcAzj0b4yaNKetk8YP2j+knBI0Lf7l1Kwu1OF6UE4Jl0Np1HDg273Dp17QFZpkEKKTiXGM8It9QXz8khSeXQXKkn7oMaU53Xd0cl400FLihPGU1rDGU9/8Vw3gTMVXzPHBiwuJhSf+Tg=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY2PR01MB4873.jpnprd01.prod.outlook.com (2603:1096:404:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 09:15:01 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 09:15:01 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC] soc: renesas: Add RZ/V2M SYS driver
Thread-Topic: [RFC] soc: renesas: Add RZ/V2M SYS driver
Thread-Index: AQHYixYUV652ffOByUKtglOD3IhflK1pNTyAgAABLRA=
Date:   Fri, 1 Jul 2022 09:15:01 +0000
Message-ID: <TYYPR01MB70866C84A8007E329741B9A5F5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628173947.91519-1-phil.edworthy@renesas.com>
 <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com>
In-Reply-To: <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c01ea1a3-f9be-48ee-68a6-08da5b422d65
x-ms-traffictypediagnostic: TY2PR01MB4873:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ltSzLSZBxSbvwhyTWNu9hnCJ9Uwi2NmSTHraWspOKO8Y4mGh+QUDWiX1IkLbnhuPDXn6ipi8UGSRgHtSzxbh6zZ4oamOXjnw97SiOs3ofsIE47zpBIn5db+YRit0OLAcG3bibAaIp16G8iNNmoDnGydczjVEra5YRUaX16Gyf+b7QNRWH5qN39C1FFYrQEf0XyXbgszoTVkRk3u/0xs4e9LSamWSn77hWpzistv0BPaNA6Psdhv2w6vm5aGtfzIkUEV6T8MH1g/xKL/3ULO1k0abnPXytcDZZzjm+hnYmI5AhTzFqWuw19M9aSj4x56z9HV9ek3T4KReY8aIJySb1ziYeT/vliu+RKV5dFg7JEO6bSB0RMS0N5CtlFU2CDsDrsvSVniIV50MTKgIA+cWsL6IEGtocwpPQLER/qmKElknOOWq3sTc5Ly0iqx3Ozo8+HqjqEylCyDvP+UChcPhEv0ek3IlImIBNYQsAuIpq7LDueXkp2OxxAzIhm9Mug/xGb69TtNfxQVt3Y2tqfqoh2am5s5HxefHMv75IKKchSIMkzDvu9E75Fd72/nNrXQrfJ9Ip3XJ74TmOtdy5lPFav3YYdO2w9aqp5huE8QTs5Viu3NsB835uJ8+bQMKeLTxKsy9tuJ4Z68oOQbQC6rQr8myRCBRN1Yqi8Di+NgT2FH7J3WiwiHywm5tzqtuzW0M+qLfj15Fwx+oBD6PpVez37ZfIqqVBXnr+/W0suer2sRwaKcMFzLIhoGttVS96mAeo9Bc7VUi2HuTzOZz48WfHzMr5eD0hmVy8HUBOMUZ/sColXkN54Jj7r4SqJq9VOdo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(41300700001)(55016003)(83380400001)(478600001)(9686003)(26005)(2906002)(186003)(8676002)(33656002)(53546011)(7696005)(64756008)(71200400001)(4326008)(6506007)(66446008)(122000001)(66476007)(38070700005)(6916009)(66556008)(66946007)(76116006)(316002)(5660300002)(86362001)(44832011)(52536014)(8936002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEVCSjNQWldZUDNISll6SWhDU1Z0T21uNXBNRHZhYmkrNDMwYktGS2lod015?=
 =?utf-8?B?T2hvcWoyNENzc0xqUWtvVjRraHp3c0FzdnJxdWtDb0FHemVCeHp1QkcvZUpV?=
 =?utf-8?B?b3ZUUU5jbnBOM05IeXpnWTNLdzFPcC9zcWFlalhNUDdmM3BGN1ZhMUVHblFE?=
 =?utf-8?B?RlBrUzA5NnZUdWRTczhVa3pnTmJIUm1XVFRUUnVTMnlHdUFzSFpxQTJYUjlW?=
 =?utf-8?B?WFJrR2ZtQzNTZnh1bzdzQWtVRFBBTStxU3V4VzRISzBPYmJWRnVRcFVoZUVa?=
 =?utf-8?B?UlI5VnFzK3lKYkJwNzVZSFZ3VzVMTWhLS1lCeUJJMkpkRzhBdWdaTUtnRkQx?=
 =?utf-8?B?YVRvRGVyaUdmbVhzVjM0bFVidE1VS1A2MmFrUW9LSUhoc1B0ZmhQZFEzK1ZY?=
 =?utf-8?B?YUZqSWVwVWRlMUZ6d3ZBRllFeERtbDZONUwwekp4a3k0c2hmT3hvZlhuTExJ?=
 =?utf-8?B?clJHVWZnVk9IR2FZMHRLUlhhUnZOOHlwcmhZZkptU3dscnRVa3JjS3RzWjRG?=
 =?utf-8?B?TFluRllqOUdJNzkrSEpqRWpJdFJudDhTZzZiTGxYcEcvWFZTVzAyQ0Vlb1Z1?=
 =?utf-8?B?SWtXUEZkQTgrcEtDQTJXTXcvY1NoWEhSdjVoeDhqd09mcnNxL0g3TjkveUQ5?=
 =?utf-8?B?UUpJY1VRcENGL3FveE5ra1BjQ0h6TkV4Zi90NGRmbGdCK3ZZM1FtUGdsUGI5?=
 =?utf-8?B?NWxyRVA4VWRnVDJXQ0V2bGN2TkxxR1J6OThEb2RBSlYwQUwvYkdmQlNwVm9G?=
 =?utf-8?B?M25QQm1HYmxsMk9TZE00dlM1N25mdTBLVzYwZE01anNyMnNaWU1PNVlpVk5i?=
 =?utf-8?B?Y2xkWW9hZGhSaFk3Tzdaa0JrSUY4VldmaFJaaUVSNk0yZkM0WGFMUjlSUVpT?=
 =?utf-8?B?QWFSU2sreENhVFlUQ0o3TEtVdnNmUXhDZTRQaUpKUlVsK1dGNFBCeDRqTVVS?=
 =?utf-8?B?c3BaSDl5M1VTMmtyMEY4dk1wWVNkL1g0M2hKRkFpTmNITFNqM2xJVDlONWVG?=
 =?utf-8?B?emk4Y3NObHhVUVU4Q0lvK1M1ZHE1dWxkVTU3dmpMenpLdkYzbXNBekgraTQ0?=
 =?utf-8?B?dFVpWktGMUljY0JNVit3UlFnRzJaOVo2UXVYdFZ1cGdFaG5nejY2bzErWlRz?=
 =?utf-8?B?K0s3b0s1NGc3NzBMSmtjbXJjZm95ZVkxTzZ3Zm44c0R3bWhqRGxsTVlVQUhC?=
 =?utf-8?B?bXQ0NHFOT0YvOVhQUHlKL2c4U1A2ZW52eEZUWlZkbHBET1ZERnNpdURVVTFK?=
 =?utf-8?B?VllTVnhhYTUyTWNkdW5WMmsxeXYyU2R4TEtxeWxwUTdxOWZQdTBxZk1qVm5a?=
 =?utf-8?B?ejBSWkh4S3Y3ckxxZUpBbEcwemtmN2k4WTNoNEphR2hiN0hEYTlrRksvRUVy?=
 =?utf-8?B?OUdxejRxZDRjVGJnTGdmdlRVcVpIelhvSW1za3JRK1A0ZDBCRzRqL0UyQmlv?=
 =?utf-8?B?L244dGJVeXZ0eHdtdUdEdE5ZSVBhcWJ0dHN2WS8xa0U1OThCd004S21LZEtn?=
 =?utf-8?B?b3FJREQ3MTN2bldYZnM1UTNPdXpjSG9weXhGSHd4UlBZb2xDOGcxT1lDZGlx?=
 =?utf-8?B?ZUFvM0FvV0wrUjlOYlBERzU4OXc5TFRlZTVBVmQyeFY2V09keEpQR01VbDFp?=
 =?utf-8?B?UmpPc1YwL0VoU3R3bmtXWjZyWjBidW9SRlhSOURlZm1Lck9kU3QzNU9GSkdn?=
 =?utf-8?B?WU5ZTHVOU2h5T09vdG9PcFR5YnVPYXMweXllRTkrcWJzc1FuZUV5aG9ObndU?=
 =?utf-8?B?WXEzS2w1Ly9vM01KamFiUzh0ejM5RlIvUWVzK3RnZ21iOUtjSGNzZzRRS0M0?=
 =?utf-8?B?UmNkQ2ZVYno1ZkVkVHplSXQvbFpRbGtzMWxzeFFPbWZMTU9QZkJPbUY4NzZp?=
 =?utf-8?B?UGVOTloxemllRzdRTnQ1RHZvQ0ZaVmRyT3hvc201SnM4b0U3a2hQTTV3cDBV?=
 =?utf-8?B?QnVoNHdmMEd5dVFyNlZyR3dVL0JYa2x0YUE2MU1WZGRrc0tjOXpNRDVGSGJI?=
 =?utf-8?B?K3p0b1RaNmVCV0xlL2RtNXNSeXc3UGRzdHFjN1JnQmZXSWJyKzFBdHh3QUxQ?=
 =?utf-8?B?dHA0RlRzSERQKytsQzVZUmE0ZnpzVDBVZkZSOVUwVnFrZXQ4MkVJaGlvNTIv?=
 =?utf-8?B?WWdmZ2tzKzRIZUhBMExsZzNCTUVhTHpnMjdoamloOEhFWld2VVdkYy8zRWti?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01ea1a3-f9be-48ee-68a6-08da5b422d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 09:15:01.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41dTiXJ96PRT8O5e+54sWSwnqN2+afVTc2s1zrFds9YEHL3LPYlmD8MEzwL8lQ9AvYtEB01R836inLaruSBk88bgJc4+q3/9pQDg9JHteoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4873
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgbG9va2luZyBhdCB0aGlzLg0KDQpPbiAwMSBKdWx5
IDIwMjIgMDk6MzcgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBPbiBUdWUsIEp1biAyOCwg
MjAyMiBhdCA3OjQwIFBNIFBoaWwgRWR3b3J0aHkgd3JvdGU6DQo+ID4gVGhlIFN5c3RlbSBDb25m
aWd1cmF0aW9uIChTWVMpIG1vZHVsZSBvbiB0aGUgUmVuZXNhcyBSWi9WMk0gKHI5YTA5ZzAxMSkN
Cj4gPiBjb250YWlucyByZWdpc3RlcnMgZm9yIG1hbnkgZGlmZmVyZW50IGFzcGVjdHMgb2YgdGhl
IFNvQy4NCj4gPg0KPiA+IFNvbWUgb2YgdGhlIHBlcmlwaGVyYWxzIG9uIHRoZSBTb0MgYXJlIG9u
bHkgMzItYml0IGFkZHJlc3MgY2FwYWJsZSBidXMNCj4gPiBtYXN0ZXJzLiBUbyBzZWxlY3QgdGhl
IGxvd2VyIDRHaUIgb3IgdXBwZXIgNEdpQiBvZiBtZW1vcnksIHRoZQ0KPiA+IFNZUyBQRVJJMF9C
QU5LIGFuZCBTWVNfUEVSSTFfQkFOSyByZWdpc3RlcnMgY2FuIGJlIHByb2dyYW1tZWQgdG8gc2V0
DQo+ID4gdGhlIDMzcmQgYWRkcmVzcyBiaXQuDQo+ID4gRHVlIHRvIHRoZSB1c2Ugb2YgZmlybXdh
cmUgd2l0aCB0aGUgU29DLCB1Ym9vdCBpcyBvZnRlbiBzZXQgdXAgc3VjaCB0aGF0DQo+ID4gdGhl
c2UgcGVyaXBoZXJhbHMgY2FuIG9ubHkgYWNjZXNzIHRoZSB1cHBlciA0R2lCLiBJbiBvcmRlciB0
byBhbGxvdw0KPiA+IExpbnV4IHRvIHVzZSBib3VuY2UgYnVmZmVycyBmb3IgZHJpdmVycywgd2Ug
c2V0IGFzaWRlIHNvbWUgbWVtb3J5IGluIHRoZQ0KPiA+IGxvd2VyIDRHaUIgZm9yIExpbnV4Lg0K
PiA+IFRodXMgdGhpcyByZXF1aXJlcyB0aGUgU1lTIFBFUkl4X0JBTksgcmVnaXN0ZXJzIHRvIGJl
IHJlcHJvZ3JhbW1lZC4NCj4gDQo+IERvZXMgdGhpcyBpbnRlcmZlcmUgd2l0aCB0aGUgZmlybXdh
cmU/DQo+IElmIHllcywgd2h5IGlzIHRoaXMgbm90IGJhZD8NCj4gSWYgbm90LCB3aHkgY2FuJ3Qg
VS1Cb290IHNldCB0aGlzIHVwIGNvcnJlY3RseSBmb3IgTGludXg/DQpZZXMsIHRoZXJlIGlzIHBv
dGVudGlhbGx5IGEgcHJvYmxlbSB3aXRoIHRoZSBmaXJtd2FyZSB0cnlpbmcgdG8gd3JpdGUgdG8N
CnRoZSByZWdpc3RlcnMgYXQgdGhlIHNhbWUgdGltZS4gSXTigJlzIHVubGlrZWx5LCBidXQgcG9z
c2libGUuDQpZb3UgbWFrZSBhIHZlcnkgZ29vZCBwb2ludCBhYm91dCBVLUJvb3Qgc2V0dGluZyBp
dCBjb3JyZWN0bHkuDQoNCj4gQXMgbW9zdCBSQU0gYXZhaWxhYmxlIHRvIExpbnV4IGlzIGluIHRo
ZSB1cHBlciA0IEdpQiwgd291bGRuJ3QgaXQgYmUNCj4gYmV0dGVyIHRvIHVzZSB0aGUgdXBwZXIg
NCBHaUIsIHNvIGJvdW5jZSBidWZmZXIgY2FuIGJlIGF2b2lkZWQgZm9yIG1vc3QNCj4gdHJhbnNm
ZXJzPyBPciBpcyBpdCBpbXBvc3NpYmxlIHRvIHNldCB1cCBib3VuY2UgYnVmZmVycyBpbiB0aGUg
dXBwZXIgNA0KPiBHaUI/DQpBdm9pZGluZyBib3VuY2UgYnVmZmVycyB3b3VsZCBiZSBiZXN0LiBJ
IGd1ZXNzIEkgaGF2ZSBiZWVuIGd1aWx0eSBvZg0KdHJ5aW5nIHRvIGVhc2UgbXkgd29yayBhcyBz
b21lIGRyaXZlcnMgbmVlZCBub24tdHJpdmlhbCBjaGFuZ2VzLiBJbg0KcGFydGljdWxhciwgdGhl
IHVzYiB4aGNpIGRyaXZlci4NCg0KUGVyaGFwcyB3ZSBjYW4gY29udGludWUgZGV2ZWxvcG1lbnQg
Zm9yIHRoZSB0aW1lIGJlaW5nIHdpdGggVS1Cb290DQpzZXR0aW5nIHRoZSBiYW5rIGFkZHIgcmVn
aXN0ZXJzIHNvIHRoZSBwZXJpcGhlcmFscyBhY2Nlc3MgdGhlIGxvd2VyDQo0R2lCIGFuZCBnaXZl
IExpbnV4IHNvbWUgbWVtIGluIHRoZSBsb3dlciA0R2lCIGZvciBib3VuY2UgYnVmZmVycy4NCg0K
Q2FuIHdlIGxvb2sgYXQgbWFraW5nIHRoZSBkcml2ZXJzIHVzZSB0aGUgaGlnaGVyIDRHaUIgbGF0
ZXIgb24/DQoNCg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5l
c2FzL3I5YTA5ZzAxMS1zeXMuYw0KPiA+IEBAIC0wLDAgKzEsNjcgQEANCj4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogUmVuZXNhcyBSWi9W
Mk0gU1lTIGRyaXZlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgIFJlbmVz
YXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gPiAr
DQo+ID4gKyNkZWZpbmUgU1lTX1BFUkkwX0JBTksgICAgICAgICAweDMwDQo+ID4gKyNkZWZpbmUg
U0RJMF9TSElGVCAgICAgICAgICAgICAwDQo+ID4gKyNkZWZpbmUgU0RJMV9TSElGVCAgICAgICAg
ICAgICAyDQo+ID4gKyNkZWZpbmUgRU1NQ19TSElGVCAgICAgICAgICAgICA0DQo+ID4gKyNkZWZp
bmUgVVNCX0hPU1RfU0hJRlQgICAgICAgICA4DQo+ID4gKyNkZWZpbmUgVVNCX1BFUklfU0hJRlQg
ICAgICAgICAxMA0KPiA+ICsjZGVmaW5lIFBDSUVfU0hJRlQgICAgICAgICAgICAgMTINCj4gPiAr
DQo+ID4gKyNkZWZpbmUgU1lTX1BFUkkxX0JBTksgICAgICAgICAweDM0DQo+ID4gKyNkZWZpbmUg
RVRIX1NISUZUICAgICAgICAgICAgICAwDQo+IA0KPiBUaGVzZSBmaWVsZHMgbG9vayBsaWtlIHBl
cmZlY3QgdXNlcnMgb2YgR0VOTUFTSygpIGFuZCBGSUVMRF9QUkVQKCkuDQpBbm90aGVyIG1hY3Jv
IEkgYW0gbm90IGZhbWlsaWFyIHdpdGghIFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0Lg0KDQoN
Cj4gI2RlZmluZSBQRVJJMF9TREkwICAgIEdFTk1BU0soMSwgMCkNCj4gDQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIEJBTktfTE9XRVJfNEdCICAgICAgICAgMA0KPiA+ICsjZGVmaW5lIEJBTktfVVBQRVJf
NEdCICAgICAgICAgMQ0KPiANCj4gSSdtIG5vdCBzdXJlIHRoZXNlIGFyZSB1c2VmdWwuICBUaGUg
dmFsdWVzIGFyZSBqdXN0IHRoZSBoaWdoDQo+IGFkZHJlc3MgYml0cy4NCj4gDQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByZW5lc2FzX3NvY3NbXSBfX2luaXRj
b25zdCA9IHsNCj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwMTEt
c3lzIiB9LA0KPiA+ICsgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4gK307DQo+ID4gKw0K
PiA+ICtzdGF0aWMgdm9pZCB3cml0ZV9wZXJpX2Jhbmsodm9pZCBfX2lvbWVtICphZGRyLCB1aW50
MzJfdCB2YWwsIGludA0KPiBzaGlmdCkNCj4gPiArew0KPiA+ICsgICAgICAgLyogU2V0IHRoZSB3
cml0ZSBlbmFibGUgYml0cyAqLw0KPiA+ICsgICAgICAgd3JpdGVsKCgoMyA8PCAxNikgfCB2YWwp
IDw8IHNoaWZ0LCBhZGRyKTsNCj4gDQo+IHdyaXRlbCgoZmllbGQgPDwgMTYpIHwgRklFTERfUFJF
UChmaWVsZCwgYWRkcl9oaWdoKSwgYWRkcik/DQo+IA0KDQpUaGFua3MNClBoaWwNCg==
