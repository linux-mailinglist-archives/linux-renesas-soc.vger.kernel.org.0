Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BB1694424
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 12:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjBMLNd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 06:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjBMLNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 06:13:17 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2136.outbound.protection.outlook.com [40.107.117.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0206A7EF8;
        Mon, 13 Feb 2023 03:12:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzFF2b8O9XywZi1B8OyLSVjkE40bWlSUk4l/qx28OvbGUc8mNGsvuTcSZ/e0fi5jb++cPvul+JaIFEF0qca4C/+MpW/bdtigh2hhhTDqR8ljGraAgGMedJ7qxm2ZyAl2gVV5dmzjObev69CeyzvQkAGoOOKpMlEe7pX8U2u9Wc66jeMX/Eco7C/uLIdbbsDsdds2+q7qbv4laS9XW0X1NunJu9cZCuNkDspEskGv7xahHEQRF5BtRILs44EFIlUtUV2dFyscZxg3vJKd+jr9/byapw27f4ibzxo8PWnYbBXKzsJllElAx1dL7tggb+Pyde/yuEraIAcOXaruZtpEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPI6a7avbQO5wQpkR8E7t7xieGYSnEjgcLa1OS0hGAI=;
 b=ntZE/ZPQIsiH92oq8fvUNysVEyvOFM7wNxckZ5FWazeNo9bmFXxtBIxcvMCZLgdqsGnH2lRU6TF/msCf3v3Qh55r85KIcT2Uo1quBYygxGgXQNfb0Cy2sW7cfSwYKjqr2e+bjmFqBcDTV4Nq42+MS+PDNX6+fRmNX/Y4hQTlHfIfKy0V/OgB/8sReBaTlQuqZNiSLyTiZZBHUqD/3VqmIwd+0daEmAx+aAWn9fHhihvLbkmfr48I0UcO0wrO7IPftb183RON1GQpe6rNcBWflZh4pc/sD8cOYSKf9stQal5QxtzMugpufj6+5OoeatHZiNCeq4CMb9DZNZEu7O9zkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPI6a7avbQO5wQpkR8E7t7xieGYSnEjgcLa1OS0hGAI=;
 b=YWwPFI5z5OcRQcPQ+d8meIzVEzvEWOYInfH5OPr+rNmlxbr00ii/Hg30+v5d4bQ0a9PEdo7L6/JGFqKS/Xz8gMZI/75+d1q4YQEWrrxWcVMFsqF8Xv+Wer7axDO64k/0202coS03kuPgH3J57CBrqTTLiDO+zPToUFDqOA/fjvw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11728.jpnprd01.prod.outlook.com (2603:1096:604:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 11:12:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 11:12:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAABLMAgAAbYIA=
Date:   Mon, 13 Feb 2023 11:12:19 +0000
Message-ID: <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org>
In-Reply-To: <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11728:EE_
x-ms-office365-filtering-correlation-id: 6c706070-ce7c-4fb6-ebfe-08db0db32c2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +gIYU7DlO1rrRVhG2bLM/fveZcjL79QN+5Bj3DMbVaJ7mzv3zXuKmpe4SUoqiDCaIAM1KNDQnr54as79jQ6rGcMxMIHcvzgVN/YUcvOxV6kqVTDb+zdk33xyxH3vxXMwL/Gdzc0eyX3T7LSafNG3AOyZCtVW2/9Smt6/7oeaY+MK+koAN8PIXskVte5ORU21ktsnzu4RpcK5SV65HP1yIqew/zuLzXv2iTSHiM8Dnzxec4efPZ3wpRW43DoxpIw9LNNjbEMkdrcLiqKmq/msBdlsNEm8LFRmU3CfhXmykkV3P5w/2Vk4G0FcsOHJsAUDch5tRWy47m/TGWrg5LkHXRx95kmvI0l9nJBvCANxaJ1KKaZh25YMeDlCu/G6hP9NFSri4Zf4q/4MCJ+o1GeFfnSg+zX+IzQpD2V4VH5xLqxIaF6v7HqJEy8j3ldFKmC6/GL+De7aDR1k4wnrqOeg9X8ngF8zJ0SF6K0o5On+7/+X6CGqycXb4BDUGswtv/jlfDMrz22d4F7UJaBALXM2ZsSz1pnyt9bGTBlPzz6w2watt8esN8pu2KMb0gvhr+u6Ke56nccKbp08JoBUC1jwTnVDxbHdvopYzGqBEIGHZaEKQWOMd8Cjx4+eGN8jqImEFM4uBphp6A5XqSJZEDm9b2V/ghTjwf4YiOD7MM1zDyjGDjqRRj1S9yDPZLj38jtEDJCcXqezud/Dhwl5XvYDoA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199018)(33656002)(86362001)(38070700005)(38100700002)(122000001)(66446008)(8936002)(52536014)(5660300002)(41300700001)(316002)(64756008)(8676002)(4326008)(76116006)(66946007)(66556008)(66476007)(55016003)(54906003)(2906002)(7696005)(83380400001)(71200400001)(110136005)(478600001)(6506007)(9686003)(186003)(26005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHNsZWhIbU14QjdENWY5Y0ZqZVZVUDZvNkYyV0V3MHowT1ExL0RJcXZiOHNl?=
 =?utf-8?B?UUxZRytqN2dNTkRvTVRYNXJiTm5pZmpBTm1FZHdMYWtxK0tSblZvRFFIV2Vs?=
 =?utf-8?B?THBEU2ZSbkpFcVMvSEVGT0NzRG05YmExYXlyTE5kTjJTcXBNUkhJZ1RIcjNF?=
 =?utf-8?B?bVpidEl5TlluS2doWmZCUkt3ZFpqS0x2dVF1NHBQM1lPSy83N3dzZGg2eVZn?=
 =?utf-8?B?UU00NzFlZ3FldDZGejFibThScmZScFVtNHhUOHNiUjBFbkczb3VOR2tDZE1W?=
 =?utf-8?B?OVNBdy96K0xDQ0tJcmU5ZnVUVUJYaVZjekMvLzJaUDVoZi9nd0UzczNTQkdW?=
 =?utf-8?B?NzRUb1hPNTU5U21WZGhrSDlhQXdITFZIZ3NJSC9pbi9sbWVzR2poSm1WaVll?=
 =?utf-8?B?WU9HYlY1Q1Y5VTh2VlZCQmE4QUVKZGxkRVhGSVZmRWE2V2dJRHBPMnFUZ3pF?=
 =?utf-8?B?QzBWQUI4aUVnSmdDaC8rS3ZjSFU5R25iRHB3aTM0RmcwQUVoWXRRbmpwWW5T?=
 =?utf-8?B?Wjd5VDVRcDQ1Qzc2dkI1NVZrdlQ5dGw2SmV4M1R3ZDhTcmd1NFV2SUs3T3B1?=
 =?utf-8?B?Vi9HSWtRY0dkTVVVbnhYSDhYa3hpemtVUWQ2UEZ5NnFUSHo4ampzQUVxL0pr?=
 =?utf-8?B?ek1sZlVVem5jd0c5MVN2Wk1QVjdJemg1Z2lYQU4xL2xLRzd4L2RVdWtKZUlK?=
 =?utf-8?B?b0RSYTRYQUZWWUlMUElvcWorQlgrdlN2U01wMlovbHVEcmJ0a3VWY0hsRHIz?=
 =?utf-8?B?bTJpMHdCZXpXcm54NE5rbXNqeExzdm1nSFRwc2NGTHppamJmY0V6VExsZlIx?=
 =?utf-8?B?SUdJL2FRMTJUWmpUMUVUVkg1WS9MOFZsMnV3a3RXVjNITmgwV0J5S0FsOXBZ?=
 =?utf-8?B?TUZ0S0lxUFp5dmNQd05UUytwOEpxNVdYOGd0T1ZuYzhEdEYySnhITzZSZHVT?=
 =?utf-8?B?VnM5RnJtTndkKzZTV01YQS9sazc1b3lEaHkvaXFGWnZ2Q1B6ZUQzNGZhK2FD?=
 =?utf-8?B?aVh4cXZVZXkvcGRmNENQcHMyWHpPZ0ZIbzhBV0RlYWg2ZTcxQ3NQcGp3MDVC?=
 =?utf-8?B?Y2ljVzJ0bmFjMXV1TkdaRlJNSjFDM1NuR0lMd0hJTnRrNDNzRU1TL01yWVlp?=
 =?utf-8?B?QnFGU0VsK0JUdTBPZTg2STF3dDlkK3pZRFV3WGVyWjhkYndjc1FSTGRLb210?=
 =?utf-8?B?akc5cUk4bUlSazZwYlhJYjVYdkF2ZnFFeE9pUXo2enQzUkZ4RXlxSDcrbTVR?=
 =?utf-8?B?U2FObkN6bGZTZzQzSjBZNWZDMWdKNGxUeTZlaUlQNWEvZHRXVXppQjZSQURQ?=
 =?utf-8?B?QUwwY0pjZTAwNkorb0lZM2l5T0VBK0Jrayt3bllFb3R4QUtvcTE3Rkc4QkVt?=
 =?utf-8?B?a0FIcTdzVHBNY3hMeUpsbzZNTGI0V2djd1JFQUlQbENOT3BhNHpVMHhsRG0r?=
 =?utf-8?B?TmE0YkFSOXowTkhhVlkxQzcyRXpQbFI3NS93dThTdzFqRHlJa0crYkJkQjg1?=
 =?utf-8?B?cXhMa0Q3UUtxSjhJQkF4cTY3dXFsWkFKQWw1YmE4NkpKakxRbDVJY3VNL3Fx?=
 =?utf-8?B?TmlmcWtmZ3k0aEowUFlRMExFRUJPa2pwRldibXgxU29pcW93N2Y5OElkZENX?=
 =?utf-8?B?VVY3MGd4QWNzY3AvUEt0OXFvYUIyVWEzaVN3emk2MmF0WXBLZ25CSjNLcGtL?=
 =?utf-8?B?bGQ0clhWVk4zTkF6VmRqNzhCcFJZdlZEM1E3NnJUeHVTQWZXbVdDQk1JVFMz?=
 =?utf-8?B?b1kwWTBSSElEV2pwSTk5NFZLd0xseE1HQnFvMEh3MUJFUitsQnA1Rnc2T0sw?=
 =?utf-8?B?Mmcrd3Z1cFBsdHJVajJPNkJwRkFmaEJIamFuME5odU9NSzk0OWpnTlY0Vi92?=
 =?utf-8?B?RWJJUk5UZEhiVVhlYzZ2ZUNtRTEwWFhWdFJVYnptME5IZUwzVllGZC9NL292?=
 =?utf-8?B?Tk5DVDlsb2xDaEErVmxZZVdvd0ZKUy9MZEVpRlU4Y0RGeGpFalRUYkQwcGVK?=
 =?utf-8?B?ZzB2ZllTY2U3dWVyQXBQQU5IbFhIRk16QTJtb0VKUisvUGxZK0I0SFlyUHdY?=
 =?utf-8?B?T1NQNGZTOEhUSmVVVVhVS1Y3bEk4UFAwQm1BbnhicDBGc05XNzZXVFpva1NK?=
 =?utf-8?B?eUlPNWk3cDNSRGNPdkR2MGlXMkRvR0ZRS1FLa2JhOGRsYUpSbmY5ZXR6UHps?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c706070-ce7c-4fb6-ebfe-08db0db32c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 11:12:19.4415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clrCZQh/TtjTdz0qczUBftFGPuhc6dr7Pf3Yqftws36HHfy7cmHjEFXii7ZkEx4BGHnOcNcwqFVT2XPn0nJI1X3M49EYA4QoY47lOoYuF0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11728
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmlyaSBTbGFieSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAzLzNdIHNlcmlhbDogODI1MF9lbTogQWRkIHNlcmlhbF9vdXQoKSB0byBz
dHJ1Y3QNCj4gc2VyaWFsODI1MF9lbV9od19pbmZvDQo+IA0KPiBPbiAxMy4gMDIuIDIzLCAxMDoz
MSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gU28gbG9va3MgbGlrZSBzaW1pbGFyIHRvIG90aGVyIG1h
Y3JvcywgVUFSVF9GQ1JfRU0gKDB4MykgaXMgc2Vuc2libGUgb25lLg0KPiA+DQo+ID4gVUFSVF9G
Q1JfUk9fT0ZGU0VUICg5KQ0KPiA+IFVBUlRfRkNSX1JPX0VNIChVQVJUX0ZDUl9FTSArIFVBUlRf
RkNSX1JPX09GRlNFVCkNCj4gPg0KPiA+DQo+ID4gc3RhdGljIHVuc2lnbmVkIGludCBzZXJpYWw4
MjUwX2VtX3NlcmlhbF9pbihzdHJ1Y3QgdWFydF9wb3J0ICpwLCBpbnQNCj4gPiBvZmZzZXQpIGNh
c2UgVUFSVF9GQ1JfUk9fRU06DQo+ID4gCXJldHVybiByZWFkbChwLT5tZW1iYXNlICsgKG9mZnNl
dCAtIFVBUlRfRkNSX1JPX09GRlNFVCA8PCAyKSk7DQo+IA0KPiANCj4gUGxlYXNlIHNlbmQgYSBj
b21wbGV0ZSBwYXRjaCBhcyBhIHJlcGx5LiBJIGFtIGNvbXBsZXRlbHkgbG9zdCBub3cuDQoNClBs
ZWFzZSBmaW5kIHRoZSBjb21wbGV0ZSBwYXRjLg0KDQoNCkZyb20gZTU5N2FlNjBlYjE3MGMxZjFi
NjUwZTFlNTMzYmY0ZTEyYzA5ZjgyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCkZyb206IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCkRhdGU6IFR1ZSwgNyBGZWIgMjAy
MyAxNTowNzoxMyArMDAwMA0KU3ViamVjdDogW1BBVENIXSBzZXJpYWw6IDgyNTBfZW06IEFkZCBz
ZXJpYWxfb3V0KCkgdG8gc3RydWN0DQogc2VyaWFsODI1MF9lbV9od19pbmZvDQoNCkFzIHBlciBS
Wi9WMk0gaGFyZHdhcmUgbWFudWFsKFJldi4xLjMwIEp1biwgMjAyMiksIFVBUlQgSVAgaGFzIGEN
CnJlc3RyaWN0aW9uIGFzIG1lbnRpb25lZCBiZWxvdy4NCg0KNDAuNi4xIFBvaW50IGZvciBDYXV0
aW9uIHdoZW4gQ2hhbmdpbmcgdGhlIFJlZ2lzdGVyIFNldHRpbmdzOg0KDQpXaGVuIGNoYW5naW5n
IHRoZSBzZXR0aW5ncyBvZiB0aGUgZm9sbG93aW5nIHJlZ2lzdGVycywgYSBQUkVTRVRuIG1hc3Rl
cg0KcmVzZXQgb3IgRklGTyByZXNldCArIFNXIHJlc2V0IChGQ1JbMl0sRkNSWzFdLCBIQ1IwWzdd
KSBtdXN0IGJlIGlucHV0IHRvDQpyZS1pbml0aWFsaXplIHRoZW0uDQoNClRhcmdldCBSZWdpc3Rl
cnM6IEZDUiwgTENSLCBNQ1IsIERMTCwgRExNLCBIQ1IwLg0KDQpUaGlzIHBhdGNoIGFkZHMgc2Vy
aWFsX291dCgpIHRvIHN0cnVjdCBzZXJpYWw4MjUwX2VtX2h3X2luZm8gdG8NCmhhbmRsZSB0aGlz
IGRpZmZlcmVuY2UgYmV0d2VlbiBlbW1hIG1vYmlsZSBhbmQgcnovdjJtLg0KDQpETEwvRExNIHJl
Z2lzdGVyIGNhbiBiZSB1cGRhdGVkIG9ubHkgYnkgc2V0dGluZyBMQ1JbN10uIFNvIHRoZQ0KdXBk
YXRpb24gb2YgTENSWzddIHdpbGwgcGVyZm9ybSByZXNldCBmb3IgRExML0RMTSByZWdpc3RlciBj
aGFuZ2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQotLS0NCiBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2VtLmMgfCA3MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC84
MjUwLzgyNTBfZW0uYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0uYw0KaW5kZXgg
NjljZDNiNjExNTAxLi5jMWM2NGY0OGVlN2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvODI1MC84MjUwX2VtLmMNCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0u
Yw0KQEAgLTE3LDEyICsxNywyMyBAQA0KIA0KICNpbmNsdWRlICI4MjUwLmgiDQogDQorI2RlZmlu
ZSBVQVJUX0ZDUl9FTSAzDQogI2RlZmluZSBVQVJUX0RMTF9FTSA5DQogI2RlZmluZSBVQVJUX0RM
TV9FTSAxMA0KKyNkZWZpbmUgVUFSVF9IQ1IwX0VNIDExDQorDQorLyoNCisgKiBBZGQgVUFSVF9G
Q1JfUl9FTSgxNCkgdG8gYXZvaWQgb3ZlcmxhcHBpbmcgd2l0aCBleGlzdGluZyByZWdpc3RlciBk
ZWZpbmVzDQorICogZm9yIHJlYWRpbmcgdGhlIEZDUiB2YWx1ZS4NCisgKi8NCisjZGVmaW5lIFVB
UlRfRkNSX1JfRU0JKFVBUlRfRkNSX0VNICsgVUFSVF9IQ1IwX0VNKQ0KKw0KKyNkZWZpbmUgVUFS
VF9IQ1IwX0VNX1NXX1JFU0VUCUJJVCg3KSAvKiBTVyBSZXNldCAqLw0KIA0KIHN0cnVjdCBzZXJp
YWw4MjUwX2VtX2h3X2luZm8gew0KIAl1bnNpZ25lZCBpbnQgdHlwZTsNCiAJdXBmX3QgZmxhZ3M7
DQorCXZvaWQgKCpzZXJpYWxfb3V0KShzdHJ1Y3QgdWFydF9wb3J0ICpwLCBpbnQgb2ZmLCBpbnQg
dmFsdWUpOw0KIH07DQogDQogc3RydWN0IHNlcmlhbDgyNTBfZW1fcHJpdiB7DQpAQCAtNDYsNiAr
NTcsNyBAQCBzdGF0aWMgdm9pZCBzZXJpYWw4MjUwX2VtX3NlcmlhbF9vdXQoc3RydWN0IHVhcnRf
cG9ydCAqcCwgaW50IG9mZnNldCwgaW50IHZhbHVlKQ0KIAkJZmFsbHRocm91Z2g7DQogCWNhc2Ug
VUFSVF9ETExfRU06IC8qIERMTCBAIDB4MjQgKCs5KSAqLw0KIAljYXNlIFVBUlRfRExNX0VNOiAv
KiBETE0gQCAweDI4ICgrOSkgKi8NCisJY2FzZSBVQVJUX0hDUjBfRU06IC8qIEhDUjAgQCAweDJj
ICovDQogCQl3cml0ZWwodmFsdWUsIHAtPm1lbWJhc2UgKyAob2Zmc2V0IDw8IDIpKTsNCiAJfQ0K
IH0NCkBAIC01NSwyMCArNjcsNzQgQEAgc3RhdGljIHVuc2lnbmVkIGludCBzZXJpYWw4MjUwX2Vt
X3NlcmlhbF9pbihzdHJ1Y3QgdWFydF9wb3J0ICpwLCBpbnQgb2Zmc2V0KQ0KIAlzd2l0Y2ggKG9m
ZnNldCkgew0KIAljYXNlIFVBUlRfUlg6IC8qIFJYIEAgMHgwMCAqLw0KIAkJcmV0dXJuIHJlYWRi
KHAtPm1lbWJhc2UpOw0KKwljYXNlIFVBUlRfTENSOiAvKiBMQ1IgQCAweDEwICgrMSkgKi8NCiAJ
Y2FzZSBVQVJUX01DUjogLyogTUNSIEAgMHgxNCAoKzEpICovDQogCWNhc2UgVUFSVF9MU1I6IC8q
IExTUiBAIDB4MTggKCsxKSAqLw0KIAljYXNlIFVBUlRfTVNSOiAvKiBNU1IgQCAweDFjICgrMSkg
Ki8NCiAJY2FzZSBVQVJUX1NDUjogLyogU0NSIEAgMHgyMCAoKzEpICovDQogCQlyZXR1cm4gcmVh
ZGwocC0+bWVtYmFzZSArICgob2Zmc2V0ICsgMSkgPDwgMikpOw0KKwljYXNlIFVBUlRfRkNSX1Jf
RU06DQorCQlyZXR1cm4gcmVhZGwocC0+bWVtYmFzZSArIChVQVJUX0ZDUl9FTSA8PCAyKSk7DQog
CWNhc2UgVUFSVF9JRVI6IC8qIElFUiBAIDB4MDQgKi8NCiAJY2FzZSBVQVJUX0lJUjogLyogSUlS
IEAgMHgwOCAqLw0KIAljYXNlIFVBUlRfRExMX0VNOiAvKiBETEwgQCAweDI0ICgrOSkgKi8NCiAJ
Y2FzZSBVQVJUX0RMTV9FTTogLyogRExNIEAgMHgyOCAoKzkpICovDQorCWNhc2UgVUFSVF9IQ1Iw
X0VNOiAvKiBIQ1IwIEAgMHgyYyAqLw0KIAkJcmV0dXJuIHJlYWRsKHAtPm1lbWJhc2UgKyAob2Zm
c2V0IDw8IDIpKTsNCiAJfQ0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3RhdGljIHZvaWQgc2VyaWFs
ODI1MF9yenYybV9yZWdfdXBkYXRlKHN0cnVjdCB1YXJ0X3BvcnQgKnAsIGludCBvZmYsIGludCB2
YWx1ZSkNCit7DQorCXVuc2lnbmVkIGludCBpZXIsIGZjciwgbGNyLCBtY3IsIGhjcjA7DQorDQor
CWllciA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2luKHAsIFVBUlRfSUVSKTsNCisJZmNyID0gc2Vy
aWFsODI1MF9lbV9zZXJpYWxfaW4ocCwgVUFSVF9GQ1JfUl9FTSk7DQorCWxjciA9IHNlcmlhbDgy
NTBfZW1fc2VyaWFsX2luKHAsIFVBUlRfTENSKTsNCisJbWNyID0gc2VyaWFsODI1MF9lbV9zZXJp
YWxfaW4ocCwgVUFSVF9NQ1IpOw0KKwloY3IwID0gc2VyaWFsODI1MF9lbV9zZXJpYWxfaW4ocCwg
VUFSVF9IQ1IwX0VNKTsNCisNCisJc2VyaWFsODI1MF9lbV9zZXJpYWxfb3V0KHAsIFVBUlRfRkNS
LCBmY3IgfCBVQVJUX0ZDUl9DTEVBUl9SQ1ZSIHwNCisJCQkJIFVBUlRfRkNSX0NMRUFSX1hNSVQp
Ow0KKwlzZXJpYWw4MjUwX2VtX3NlcmlhbF9vdXQocCwgVUFSVF9IQ1IwX0VNLCBoY3IwIHwgVUFS
VF9IQ1IwX0VNX1NXX1JFU0VUKTsNCisJc2VyaWFsODI1MF9lbV9zZXJpYWxfb3V0KHAsIFVBUlRf
SENSMF9FTSwgaGNyMCAmIH5VQVJUX0hDUjBfRU1fU1dfUkVTRVQpOw0KKw0KKwlzd2l0Y2ggKG9m
Zikgew0KKwljYXNlIFVBUlRfRkNSOg0KKwkJZmNyID0gdmFsdWU7DQorCQlicmVhazsNCisJY2Fz
ZSBVQVJUX0xDUjoNCisJCWxjciA9IHZhbHVlOw0KKwkJYnJlYWs7DQorCWNhc2UgVUFSVF9NQ1I6
DQorCQltY3IgPSB2YWx1ZTsNCisJfQ0KKw0KKwlzZXJpYWw4MjUwX2VtX3NlcmlhbF9vdXQocCwg
VUFSVF9JRVIsIGllcik7DQorCXNlcmlhbDgyNTBfZW1fc2VyaWFsX291dChwLCBVQVJUX0ZDUiwg
ZmNyKTsNCisJc2VyaWFsODI1MF9lbV9zZXJpYWxfb3V0KHAsIFVBUlRfTUNSLCBtY3IpOw0KKwlz
ZXJpYWw4MjUwX2VtX3NlcmlhbF9vdXQocCwgVUFSVF9MQ1IsIGxjcik7DQorCXNlcmlhbDgyNTBf
ZW1fc2VyaWFsX291dChwLCBVQVJUX0hDUjBfRU0sIGhjcjApOw0KK30NCisNCitzdGF0aWMgdm9p
ZCBzZXJpYWw4MjUwX2VtX3J6djJtX3NlcmlhbF9vdXQoc3RydWN0IHVhcnRfcG9ydCAqcCwgaW50
IG9mZnNldCwgaW50IHZhbHVlKQ0KK3sNCisJc3dpdGNoIChvZmZzZXQpIHsNCisJY2FzZSBVQVJU
X1RYOg0KKwljYXNlIFVBUlRfU0NSOg0KKwljYXNlIFVBUlRfSUVSOg0KKwljYXNlIFVBUlRfRExM
X0VNOg0KKwljYXNlIFVBUlRfRExNX0VNOg0KKwkJc2VyaWFsODI1MF9lbV9zZXJpYWxfb3V0KHAs
IG9mZnNldCwgdmFsdWUpOw0KKwkJYnJlYWs7DQorCWNhc2UgVUFSVF9GQ1I6DQorCWNhc2UgVUFS
VF9MQ1I6DQorCWNhc2UgVUFSVF9NQ1I6DQorCQlzZXJpYWw4MjUwX3J6djJtX3JlZ191cGRhdGUo
cCwgb2Zmc2V0LCB2YWx1ZSk7DQorCX0NCit9DQorDQogc3RhdGljIGludCBzZXJpYWw4MjUwX2Vt
X3NlcmlhbF9kbF9yZWFkKHN0cnVjdCB1YXJ0XzgyNTBfcG9ydCAqdXApDQogew0KIAlyZXR1cm4g
c2VyaWFsX2luKHVwLCBVQVJUX0RMTF9FTSkgfCBzZXJpYWxfaW4odXAsIFVBUlRfRExNX0VNKSA8
PCA4Ow0KQEAgLTEyMCw3ICsxODYsNyBAQCBzdGF0aWMgaW50IHNlcmlhbDgyNTBfZW1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiANCiAJdXAucG9ydC5pb3R5cGUgPSBVUElP
X01FTTMyOw0KIAl1cC5wb3J0LnNlcmlhbF9pbiA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2luOw0K
LQl1cC5wb3J0LnNlcmlhbF9vdXQgPSBzZXJpYWw4MjUwX2VtX3NlcmlhbF9vdXQ7DQorCXVwLnBv
cnQuc2VyaWFsX291dCA9IGluZm8tPnNlcmlhbF9vdXQ7DQogCXVwLmRsX3JlYWQgPSBzZXJpYWw4
MjUwX2VtX3NlcmlhbF9kbF9yZWFkOw0KIAl1cC5kbF93cml0ZSA9IHNlcmlhbDgyNTBfZW1fc2Vy
aWFsX2RsX3dyaXRlOw0KIA0KQEAgLTE0NCwxMSArMjEwLDEzIEBAIHN0YXRpYyBpbnQgc2VyaWFs
ODI1MF9lbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHNlcmlhbDgyNTBfZW1faHdfaW5mbyBlbW1hX21vYmlsZV91YXJ0X2h3X2luZm8g
PSB7DQogCS50eXBlID0gUE9SVF9VTktOT1dOLA0KIAkuZmxhZ3MgPSBVUEZfQk9PVF9BVVRPQ09O
RiB8IFVQRl9GSVhFRF9QT1JUIHwgVVBGX0lPUkVNQVAsDQorCS5zZXJpYWxfb3V0ID0gc2VyaWFs
ODI1MF9lbV9zZXJpYWxfb3V0LA0KIH07DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBzZXJpYWw4
MjUwX2VtX2h3X2luZm8gcnp2Mm1fdWFydF9od19pbmZvID0gew0KIAkudHlwZSA9IFBPUlRfMTY3
NTAsDQogCS5mbGFncyA9IFVQRl9CT09UX0FVVE9DT05GIHwgVVBGX0ZJWEVEX1BPUlQgfCBVUEZf
SU9SRU1BUCB8IFVQRl9GSVhFRF9UWVBFLA0KKwkuc2VyaWFsX291dCA9IHNlcmlhbDgyNTBfZW1f
cnp2Mm1fc2VyaWFsX291dCwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHNlcmlhbDgyNTBfZW1fZHRfaWRzW10gPSB7DQotLSANCjIuMjUuMQ0K
