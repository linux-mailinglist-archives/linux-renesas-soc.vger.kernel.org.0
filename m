Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374AD4CBBAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 11:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbiCCKtX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 05:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbiCCKtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 05:49:22 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E1E177D0F;
        Thu,  3 Mar 2022 02:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U60xKIccb+wlBRn29F8UJhF45GzsezTcF8SQeTOxYPfFO0MqfyZ417429ENCUrpiw1WV2WwvEBUXBoi+v4IN7WNqNLNtNZYexuzCQ666ohKUqQ0Cvxig6JGYJ9zrAdJ8G2t/heRgFxYrCQzJPb6oDqHzXqvVErFu+9lQRg7KR1GMLFCfjgp1J9Rm6DMc6z/qER0FgqBdPS03bXGfP9AM3ju9/Tc9h9k+ptv9Ud6qnkP9gZJxUTSVWHBkB7AGnge/P4g0EpbMl2NaABmYL0JRbDxAR7/6NUKe+RACdrqDQQWI69/nQSRCoeNKf20cBpu/umq/3x6Rwa/vQBJzzcg5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8atejXMU/Tu1wx5bHtoCoTInOWQ/7HUBjRh6hQQ07U=;
 b=VnrwGry2JTBqhLRP3vkIGTdMVDYnHXbiFEyKTL8Q7/ew6ZsKEKOgz04R4RMZPYQZOQ7OIfJGVesr8XsMc71dY8FY0anox13XJNQSHDg0dkY/IavAcW1VTQE8M+v7iTeviGp19vRyEemgu3fKQkCW968EIsMvnM2PjASiMTpNZb8OJcCVY53kk7ZitNQBy2C7Gnjs02/5Lvf4d7M83qpUo+SjFto57p1IBH4P38d4UnMYUvYqcmsbAjOmdKB9QekyUVsJsrk4eKqRGn/QcAZy+KcwKF3lm6pT6lsy8AS/fCdw8zvkvTpQCQ7GAvxatMO9MKzdF7CTM38WEJOJRYVTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8atejXMU/Tu1wx5bHtoCoTInOWQ/7HUBjRh6hQQ07U=;
 b=QqTnHGF6zsZlRTvW3W4Bn/kmZTypeHaZpjZZR4cNejXbVtyiHYVZDBYgC3XCzdwvMFpEMUJ9owVyMcXQde4PESpqKpmux+cjN2DwYH3PnkslfWIsNQcZ45bIRpaz2j6jcs7/QOUtudmBlIVne1m4sTVsTn13vev1L79TRBAMP0Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6348.jpnprd01.prod.outlook.com (2603:1096:400:a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 10:48:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:48:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
 string for RZ/G2UL SoC
Thread-Topic: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
 string for RZ/G2UL SoC
Thread-Index: AQHYLt0GxdAENj1IRU+g0GIU0w2p0KytXh8AgAAMYDCAAAhygIAAA2Vg
Date:   Thu, 3 Mar 2022 10:48:35 +0000
Message-ID: <OS0PR01MB592271A192E4F5A445428CF686049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
 <20220303085934.29792-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
 <OS0PR01MB5922D605643E8F52D15B069586049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUZw5bxUgEif=pT-2Gm1ha-Z01r+AJ6ieC62SwkfMYD5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUZw5bxUgEif=pT-2Gm1ha-Z01r+AJ6ieC62SwkfMYD5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7e2f73d-758a-4746-6dd1-08d9fd035dd4
x-ms-traffictypediagnostic: TYAPR01MB6348:EE_
x-microsoft-antispam-prvs: <TYAPR01MB6348E7EB8B4DA3CAAEC6E90A86049@TYAPR01MB6348.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R5yEchIJ2KxiAXBGPHHL+c4qczQGgffhReKO28v0Wl0JpFkWT8EsfH91nyXGDk/ExmlADUyTdSN2sUhJaNJP/qli9KxAEfcTPZzZlS7WMJ5GyaFQD8Ohr6XEzDfViqI10bJ0tCvz7SH1MrODLoIE7ynvFITmVdVbMx15rQZtdwsfIeiZ8Y8ebT1bwTlU1pvSCZyECAM3zeuDXFt5D8hMa0/WDuAD0s07BpayIVmYYC3ZML3K0VuuiM/mAY2QKknHZOb4XYIDsajs+2Cn86S68UdJjG87CoPYBT8GM7hZY9w/f6NozmM2BqLUZJvCoOf6QU5vTBgu/oBpu0K8XnjDqUl2VWeKZv1DBPJPLFKMogffNXY/WE+p8vSvBquU4u4RyU/Ws3JTP2vqfmOFL5ks/awONZu8/mbr4cc1G3DsxuUrohZ/OZoeKRX2k4suJieEqVUusBbVpjkRdUIPW3Txjxt/5lYclLfSG9HYf8ZVmP2mv27rdlxe2fwIlN1UilMh8m81LJ/n05Ac3f+oKLFmStPc+jRm/8EELc7cWJfrgXq+70goOU+AOi2ODvBZz2R8a+aUjEHX/xcEZhMFtARgs9Gveq9i0an6hRv3KFXatCeu5X1QsN0fRN1JlVYUCzYtQAldaKj2S7jcOaOGOb/wtEMEk39e7fTlhtihqR3rvOXAkttCQWqFBkbCTcu0x78+3M/q9x9w6I6y/9JyzQ5pmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(66946007)(76116006)(8676002)(64756008)(33656002)(86362001)(66446008)(54906003)(4326008)(66556008)(66476007)(6506007)(53546011)(7696005)(316002)(508600001)(9686003)(38070700005)(5660300002)(83380400001)(8936002)(52536014)(71200400001)(38100700002)(55016003)(26005)(186003)(2906002)(122000001)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R21UVXB0R1UrelNVeW5SSEZGcFBST3oxM2pLQ2tleFJQKzh3TExtRlFvckdO?=
 =?utf-8?B?OUhKN0d0ckNqMU5NeHBZQXRRbUJEZkpkb3J4cW14VWUxdll3eUhaWkVxRXJn?=
 =?utf-8?B?d2Y5TWhFNFJLRU5XM0p6c0hRUE5uZzJEelRIZ3NNaDNzZmU3V3loblF3TVl0?=
 =?utf-8?B?TC83dEswK2IzaGFvdExmVWRDMnhSbXZxOU44MnNJSzNiTlJPM2x5YUh0dXNE?=
 =?utf-8?B?bExXRTFnQnV2Ukd2dkRkbVM3T3NEVE1HQUQ3SW9SdW11MCtGWms2L1dhRi8r?=
 =?utf-8?B?SnFEN1NSWkp1NWlyMU01YzI2Vk8xa0VFaDdiWDIyY1BobFczb1oyS0wwanBP?=
 =?utf-8?B?MFM1R0N1SkJBOE12YktITmY4dGpKK2Q2QmJkQTFQZmM2R2w4TUJHTW5CbWZH?=
 =?utf-8?B?Yll6c3pIVDNvNld5VG5IUmoxbTNmUnVCNis3T1ZuWjZEZXFpVm84STQ2K0dM?=
 =?utf-8?B?d3AvZnBqcWRhWjl1aXR6TUJ5UEZnUUNwdmJUUStVU2FVczBOdTMvZlVtMXhl?=
 =?utf-8?B?WUhhSzEwKzU5czdiRjd5TXRGT0oxTjZBSmxNVnZBUVZqbVJWVEJjS3hxWkR0?=
 =?utf-8?B?RjRPZjhwQlhzRVZ3bmVCajd4RWtDQlVxSmJVVGYzSEJLc2R3Tm5OZFA3OHMw?=
 =?utf-8?B?Y3c0THMxZU5mM3BKSks3a0lJeHlhTys4akV1RnlmSFk1anNLbEFSZ3ZrY3NK?=
 =?utf-8?B?b3JKWTE3NjhnenBxWVdXWDVMb2xuUjRTbzNQVXBBUVRpVjgzM0hCSXpOaHl3?=
 =?utf-8?B?T2twNTN6K01rUlhkYk02SGdOSVpRZEs4Sm96YllXb2w0citMbkxCdkpIS0xI?=
 =?utf-8?B?Mk50QTZJWXZPZGFDSmxQTnoyNzB6bWxRYlBMRmtKdkRCWEtqY21Rc1h3RUFt?=
 =?utf-8?B?UWhFNXZqUnRWQ0xBWXlhQnI3ZGhIS1h4T3Rhb0NLNyt2TmZsY2EyZVIwM1Ir?=
 =?utf-8?B?NkpVZm5ET1BHRk5SWkZhUU5vckU0QTd2ZWhRMDZEbUU2NjRscWp3b0FGcTBv?=
 =?utf-8?B?NmhmRmg3eU9uVXg1eHlZZnpKeHVQanIyTzZyckNvUkxOcWtZbW1GZGJtaFJB?=
 =?utf-8?B?RCtobkZZMTBiRFZ4YkZmVW1UWFQwVkU3b2ZKTklsM2NHODl0YzFNSHEvMVgv?=
 =?utf-8?B?cGErVlpyVG44dXJNY2sxSEpyYjVSZnpoS1YyaEhwdEdTLzg0R25HeTNlcVdh?=
 =?utf-8?B?NlVCQllZTEgxZE4vMVRiL3FQV0tsMHpORi8xbFZTQkE4T3BQUTR1NHlnYUNF?=
 =?utf-8?B?dXFvRUVITC9YUlJQaFNieFdYMWM0NGYrNENmNUt6Ym9FeDhGOVFDVjVKUEVy?=
 =?utf-8?B?a1FVUzhmeFdTWDgvVXVvYW9lY3JkVzVPb2VLdnpwT3pvOTlRK3FYL2ZTWHQz?=
 =?utf-8?B?OEJDL29iU1RHc2NhZUpmSWxScklGMDd5VGc3YTZwYjJObzFWTnJUQ2xZaFo4?=
 =?utf-8?B?RlUrZm5kd2FSZko1cHJlUVN6V2dIdXZIckY4VXN3dldPZE1GZTR4VTFVck12?=
 =?utf-8?B?TklJYmlyK2N3TWpla01QeVJ4anVEYzZ2dVJHclRqODkxRXAydGpKbU1WWWhu?=
 =?utf-8?B?R3ZjaXBPTXBQckNBUVFqWWlNaFo5RXBSUDIzUkNhNDAreEJRWVNGa2J1TmlP?=
 =?utf-8?B?bm9ES05oVktuZU9HMUIvSkdsazdaSFN6eXJQZzhPOG5xRVdzUy9DOWZqYXlx?=
 =?utf-8?B?L1BTZmxnWGdHaU5XT0dRUDcxV2NGdFBpb1p6QXpxNk5zVnZydlhpR0xvclFr?=
 =?utf-8?B?eTFCZlRWdkNRVGRNNFlXRW9BYnE5Z1RRNFdJUlA0N3dZY3RycW0zeHVNZnZQ?=
 =?utf-8?B?RHFYc1Y1M3ZRakpaRjExVFNnMjVjZzlwcU5KclMwZ0cyNzJSbFZUcTRMYVcw?=
 =?utf-8?B?WThoV1ppRDdEK2dLMC9ObHBmQnVUZDk4N3ZUTkRpcUtYeUNlbE04NFpYb3Bo?=
 =?utf-8?B?ZjJzdCtiQ1hyK0tEaHJaNWx4c3JjRlNLcHk2U2ZNL2s2Z0dFc2gwMDR2OEVC?=
 =?utf-8?B?TDlTb0NjWUl2bUlBS0pDQ1hBbHk1My9TdUNaeGJCLzY5YmxhcklFeXNsQkJC?=
 =?utf-8?B?N090YUhvZHZhYnFMc0Nua1M5c1pWQ0FQNnpxY0QyV1JZTnVDMnFIYi9LajdV?=
 =?utf-8?B?WHdab2s0QWozb2tOZnhTVUtZUVZueGZMcEQ0UUhyRG9seUxnTHM5SWZITjJL?=
 =?utf-8?B?Ykk5aXE1RFBRcVlDOVhLUGlGc3hncVAvRjBDRXplOTFWdCtZV05obkltTW5G?=
 =?utf-8?B?SUJSRjkxemFJeG53K25pYlhXNFdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e2f73d-758a-4746-6dd1-08d9fd035dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 10:48:35.0099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxESnj2j28tnFwpO8MKgY32ly+ppDoOtHo17ri0amQSpm0qOw2a++9kenTAz9l8Vkc4Y1foJhWM5Pk8kEZiCQJb5ph1YgeX2bIOkUWPbUvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6348
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGR0LWJpbmRpbmdzOiBzZXJp
YWw6IHJlbmVzYXMsc2NpOiBVcGRhdGUNCj4gY29tcGF0aWJsZSBzdHJpbmcgZm9yIFJaL0cyVUwg
U29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXIgMywgMjAyMiBhdCAxMDo1MyBB
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IHJlbmVzYXMsc2Np
OiBVcGRhdGUNCj4gPiA+IGNvbXBhdGlibGUgc3RyaW5nIGZvciBSWi9HMlVMIFNvQyBPbiBUaHUs
IE1hciAzLCAyMDIyIGF0IDk6NTkgQU0NCj4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBCb3RoIFJaL0cyVUwgYW5kIFJaL0Zp
dmUgU29DJ3MgaGF2ZSBTb0MgSUQgc3RhcnRpbmcgd2l0aCBSOUEwN0cwNDMuDQo+ID4gPiA+IFRv
IGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlbSB1cGRhdGUgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRv
DQo+ID4gPiA+ICJyZW5lc2FzLHI5YTA3ZzA0M3Utc2NpIiBmb3IgUlovRzJVTCBTb0MuDQo+ID4g
PiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsc2NpLnlhbWwNCj4gPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1s
DQo+ID4gPiA+IEBAIC0xNyw3ICsxNyw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgb25l
T2Y6DQo+ID4gPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ID4gPiAgICAgICAgICAgIC0gZW51bToN
Cj4gPiA+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0My1zY2kgICAgICMgUlov
RzJVTA0KPiA+ID4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQzdS1zY2kgICAg
IyBSWi9HMlVMDQo+ID4gPg0KPiA+ID4gSXMgdGhpcyByZWFsbHkgbmVlZGVkPyBBcyBmYXIgYXMg
d2Uga25vdywgUlovRml2ZSBhbmQgUlovRzJVTCBkbyB1c2UNCj4gPiA+IHRoZSBzYW1lIEkvTyBi
bG9ja3M/DQo+ID4NCj4gPiBPSywgSnVzdCB0aG91Z2h0IHRoZWlyIERFVklEIGlzIGRpZmZlcmVu
dCBhbmQgdGhleSB1c2UgUklTQy1WIGluc3RlYWQgb2YNCj4gQVJNNjQuDQo+ID4gSSBhZ3JlZSBp
dCB1c2VzIGlkZW50aWNhbCBJUCBibG9ja3MuDQo+ID4NCj4gPiBNYXkgYmUgSSBjYW4gZHJvcCB0
aGlzIHBhdGNoLCBpZiBpdCBpcyBub3QgcmVhbGx5IG5lZWRlZC4gUGxlYXNlIGxldCBtZQ0KPiBr
bm93Lg0KPiANCj4gSSB0aGluayBpdCBpcyBub3QgbmVlZGVkLiBXZSB1c2VkIHRoZSBzYW1lIGNv
bXBhdGlibGUgdmFsdWVzDQo+ICgicjhhNzc3OCIpIGZvciBSLUNhciBNMUEgKFI4QTc3NzgxLCBT
SC00QSArIENBOSkgYW5kIE0xUyAoUjhBNzc3ODAsIFNILTRBDQo+IG9ubHkpLCB0b28sIChwcm9i
YWJseSBub3QgYnkgZGVzaWduLCBhcyB3ZSBuZXZlciBzdXBwb3J0ZWQgdGhlIGxhdHRlcg0KPiB1
bmRlciBhcmNoL3NoLyA7LSkNCj4gDQo+IFdlIGRvIG5lZWQgYSBkaWZmZXJlbnQgdG9wLWxldmVs
IGNvbXBhdGlibGUgdmFsdWUgZm9yIHRoZSBSWi9GaXZlIFNvQywNCj4gbGlrZSB3ZSBhbHJlYWR5
IGhhdmUgZm9yIHRoZSBSWi9HMlVMIHZhcmlhbnRzOg0KPiANCj4gICAgICAgLSBkZXNjcmlwdGlv
bjogUlovRzJVTCAoUjlBMDdHMDQzKQ0KPiAgICAgICAgIGl0ZW1zOg0KPiAgICAgICAgICAgLSBl
bnVtOg0KPiAgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDN1MTEgIyBSWi9HMlVMIFR5
cGUtMQ0KPiAgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDN1MTIgIyBSWi9HMlVMIFR5
cGUtMg0KPiAgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOWEwN2cwNDMNCj4gDQo+IFNvIGlm
IHdlIGV2ZXIgaGF2ZSBhbiBpc3N1ZSBkdWUgdG8gYSBkaWZmZXJlbmNlLCB3ZSBjYW4gaGFuZGxl
IHRoYXQNCj4gdGhyb3VnaCBzb2NfZGV2aWNlX21hdGNoKCksIGp1c3QgbGlrZSBmb3IgUlovVjJM
IHZzLiBSWi9HMkwuDQoNCkFncmVlZC4NCg0KPiANCj4gQlRXLCBJIGd1ZXNzIFJaL0cyVUwgVHlw
ZS0xIGFuZCBUeXBlLTIgZG8gaGF2ZSB0aGUgc2FtZSBERVZJRCwgYW5kIG9ubHkNCj4gZGlmZmVy
IGluIFBSUj8NCg0KWWVzLCBUaGV5IGhhdmUgc2FtZSBERVZJRCBhbmQgUFJSLCBidXQgdGhlcmUg
aXMgYSB3YXkgdG8gZGlzdGluZ3Vpc2ggYmV0d2Vlbg0KVHlwZS0xIGFuZCBUeXBlLTIuIEkgYW0g
Y2hlY2tpbmcgdGhpcyB3aXRoIGhhcmR3YXJlIHBlb3BsZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
