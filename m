Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E644EF759
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244815AbiDAP4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356960AbiDAPiF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:38:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB82E201692;
        Fri,  1 Apr 2022 08:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go1mbbc7EUhq+0TZMzqVw70UqHPkpdfSKJgIAkONBExTnUh3cdNncQNNxxgthBMW4R/PSvbtOo/vBCEWOKiW3F+5svN7IQGCdcmu9Y708VluKgQI/0gmB9XwVHeUgEJarpX5vhpEQ/K8FK+geX3fuRH5LHinACR1QeaMKxxzMSH+ydmofphi3nw/5qDPzl0YQb+TWWk3Nt8H5h9zIsZlBpYrWxKSsup1kUMB7EAb8bb7YKDZHBYPKqX/TdMtPPHJVXGL2I5OEBv5/8Vqb/ckuhTlByEBAow9hXgGCE3fx4e4UoKSpd0p5jF7SrGtbRTcvPdfEPBbAII5LDuW+Zg+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T62C9pqxCh1P5iuhtfkmt2fiGYt36JD99/DvxZQ6x+w=;
 b=iVp3DYibaWohx2X4nbO2Wn/JVN0svkr6GUavNo90roiqvAaV9fsuCRR2Thbdn+akkdgOjE1HXxopsVSa1FMaznCBUux+4hkIffkYq+07HBbvRsa92Em9rCEpBrBlXleZyk1sSLRRJ4Me/Hjd8JAVFI5+BRwCn8MrL/Q29gkMT/AiqkKANxauulbZ4L3XSb0Yz6MbKxYRI2XgH8BI8mSRJyQ5Jp9P1K3fjIlqeWS+dpZtW15Lazl3YgGjPD/lp49UP+12xCeHz4z5EiVwWDXnbRRbbBAaZFHAQp22fFxiFDz7b1fRKfDacCU3Oy1n70p2mY8zRAeiQrnt+rMm/fOdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T62C9pqxCh1P5iuhtfkmt2fiGYt36JD99/DvxZQ6x+w=;
 b=hruHd0SHjmSvYHh/NcHRgHTE6ba7RNmcEtn2FsYc7fUl8RVxAPqUYukD2qaT4ydS2mcMtMcH6h+V87W2qyhvVDVVHWRK8/caOYLW7cBhDcNyd6Iyl8F+7aIC+x8spG8vx6jY55XPTKaGLloTaUck/sijvnhB+GG3GZ226qzHsy8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6437.jpnprd01.prod.outlook.com (2603:1096:604:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 15:12:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 15:12:37 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
Thread-Topic: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
Thread-Index: AQHYOHi63Hv5VOoq4Ue7gyCInFDz26zYZ46AgAAE1wCAAteTUA==
Date:   Fri, 1 Apr 2022 15:12:37 +0000
Message-ID: <OS0PR01MB592228B7A5779A0B01BF2C2586E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdVHWvkZyjPi4i5AG2iYgMp7euS=Nf-v_rYNVS10jiW6eQ@mail.gmail.com>
 <CAMuHMdWmhfQJq53U6rKGkwGLFdnNoL-RF6qpUoE+7c0=J-ZUFg@mail.gmail.com>
In-Reply-To: <CAMuHMdWmhfQJq53U6rKGkwGLFdnNoL-RF6qpUoE+7c0=J-ZUFg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c631bf8-2e2b-43f8-bff7-08da13f20ea0
x-ms-traffictypediagnostic: OS3PR01MB6437:EE_
x-microsoft-antispam-prvs: <OS3PR01MB6437885530D2787EF6C669BE86E09@OS3PR01MB6437.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gRsyRBLAFS7AND2yruNl1U4ctDEAvj/CuxPeWtk527UOCu3nUbf/ap0eb2iOBt0s3kvf1HJibSOLY1kxPtsyouxusvSW/hyZiL1xnC6npUsOT7JjIepvMXAIvCT+u+r33gGYP+3oN4/tWF2Q4FIUuWA1uiDdz0PAPUMJMi1oYSSeUGl6tYPVEYPfOZMoHTMUIIv+IWscgQq2tDGAUfNFNK4RsE3RcBvc03is9AHan04Lv8YPkUZR8AbZNNp7zBQYFAOpbt/teHH22SrCGU4a1B0XnfzqVj0EoMD4/9nhEy5bCOZyW5ZFMJe97v/B3ZglAt48vDhDzq13hrcRLS4gi+ivxtaK78OYY7WRq/1trELSgj1Oa/A9JgXRmZnvRqCsJGkqQDj8UCxRhMG1crJ9I7YGssIvNTuPv0A3gu3e2ZTJulP4ISiaeAxnIQ2P9IPcBKf7Jn8QnV2rG5F7+JUgGAi/MzZjDABJ84qA9wPG/1vnYyirC6f9LV1ECKz9KN1LrPKmnSwjgXbTqTiyQQwhrAQM0i5B7PjbHA8qvpglIuClWZGdkMuAXegdm8c7P0NPRNSGbGzGp28YU74UF8PaT7u18WIRpmWKxSWuB0IPEM4oeRfI0BqdcAoznqYcxCAVTDB1JCVPSHNbgh90RKQxyNfqd2mO2hFE5pqzjq3xLu5H4uz+0GJkfiASqe191kP237YcWwRZUzrc25/u0f1usg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(54906003)(6916009)(316002)(122000001)(508600001)(71200400001)(5660300002)(8936002)(52536014)(2906002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(86362001)(26005)(186003)(83380400001)(38100700002)(6506007)(7696005)(8676002)(38070700005)(9686003)(53546011)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHh2N094YkJHS0VXV1c1NEVFd3dpOUF0OWhwZE9Xc0F4a2EwQmhIcTNSKyth?=
 =?utf-8?B?anlxVFJybUV1ZVo0elZkWGJxR3pGUXduNm5Lb2JCTWR2bU1Heit1ZVMxTFQw?=
 =?utf-8?B?eXFaZ1NyR04vQmN3eC9TMGF5QnVoSlNWY0J3dFNVMld1T01KMXVGeVVXZEQ0?=
 =?utf-8?B?VHpSOUNQTmJwSXZtdU1scW9XTG1TaWd1RkZTK09rTTd1LzJaa0xHbmRRbDNl?=
 =?utf-8?B?SysyNmJCRERBd1JuUEFCSUJ4emRqMUhTajZHU09rdWFlZld4UnlFOXlKVDVP?=
 =?utf-8?B?TFV6VXdqWFhSVlRicHdEeFlTVUdPTy9Rd2Qyd1NYSUVDMytGZXVxWS9xU09O?=
 =?utf-8?B?ZFBUSytsd0taOExxMG9tZVJzY2cwRXdoZzhENFJCYVZSYURxNUNVQm5YTzcv?=
 =?utf-8?B?cUhWNFN4VXdPa0dZelZUMWdmWGo1THJ5KzBramVhWTA0cExmZlg2OU85R0Z1?=
 =?utf-8?B?eG1IMThzYXEwUHFWVkk2RmJFMDQxbkpSM3BQRzFzOElJRjVLcHhZa2pHQTVT?=
 =?utf-8?B?SmdSdXJKRjgrZVQwU3ZMdFdheXMzR1RJQVJpbllPYTRIVjNvcmhRTGRMQW90?=
 =?utf-8?B?M1lqNjhFSTd4NXhYak0xQTZQRHZIT1g3TEFJR0YyOHBNTUFFMy9tL3pydkdT?=
 =?utf-8?B?L3R4NXdWNnhQRTBrWHFvaE5zTXFjQy9rQVdrRHpDRmlsVWpqZ0xuRW5JTE52?=
 =?utf-8?B?YXd0S1BWR2RMNVFQcGl1T2FEamVKL0FDdzR0NFJWbVdTOVhINE9TTDZveHk1?=
 =?utf-8?B?cjNEZmJVM0JkN21CQlVyZ01ZMFh1Z3BwYUtvakFkRVgzRG5xUTV2SDZzTmlH?=
 =?utf-8?B?UWpENDF1MlZiY3R2VW05dk5tZEo0MVU4Zk41Q1pjRXcxMmVBeWVIbXhaTXR5?=
 =?utf-8?B?SjJpbkJZNUFLNHRlRm5ZWEdVRmVsSXJuVkpTdHk5bEdnZCtXd1llb1ZPQ1g2?=
 =?utf-8?B?UmRoVmllQ21HSkFlV2dQRWFlN1RYOXBOcm5aQjBxamZ0RkoyWGxKa3lXcTNi?=
 =?utf-8?B?d1hHcDN3V3Z0Rk4yMEdpMDY4VlBXcERySlpETGZOVGZBTEk1MEQ4eHlMbXZO?=
 =?utf-8?B?ZENUMG9qTld1ZFEvMjVCR0NCSDh2YlhhZ3NwVEdFSGwwRXZKdVVEckh0eEM4?=
 =?utf-8?B?K3BEb1hLazUyQ2gzdURrVG1nbmJwRnZnOG5WR3BVZUVjdVpFMGxobjhpMmds?=
 =?utf-8?B?dWlEblhIY3hiMis3WWFkTCtCbGUxNnhlSjFtYkI1WmhmTUhsZnZiME1MU2h2?=
 =?utf-8?B?SG9IRUwxbnloSGplc3QrVmF0eWNJYTY1TllITGZXUE03YndTeW5ONjFCMkw2?=
 =?utf-8?B?VmxWN251eW44bWtCbjFJRzZDbWRWbXVlbGYxR1N6VmpOeEV5UXVtbzJPZ3FK?=
 =?utf-8?B?MjFVamxHc3dZa1p3dFN6bXR5WHZQbTVQbi9vd1BtQ0xhbU1MaXoydUlKNVVp?=
 =?utf-8?B?WktlQTcrTkZYbklXUjJPeThEMklCOE8yajZzQWs3UFhBUXBIK0lFUkJ2WUNi?=
 =?utf-8?B?cE02Q1VIZHpxejNhajJLSmRWdXhGd2tNWkhIaVd6dnJicDJRTDNQVnRkN1Zn?=
 =?utf-8?B?RXBmNWVVTlB5K2FTYWkzNXRoQkp1RVB6Qk8rQXhoSkJVWFlZL1VxSlpHVkwx?=
 =?utf-8?B?OTlaaEswZUdRaUJwZ2NiVGg3bFZUT2xJemNZbjZBNlFVRlJneUdIZDl2SlF2?=
 =?utf-8?B?SDVrb1BRejZMajNTUFZjSndmdC8wMXRVU01VQ3g5MTNMRXFrNlVLbWV1bkNm?=
 =?utf-8?B?Vy9XbUR1R2FUV3grZW00VExZeHZNRHZKSytPM1BIL2tzVTVtUFllZjBGYnVO?=
 =?utf-8?B?TTNLR3hKWkR6c1JpeFBjZzA1QlZFZ0dLT3VCd1RvaEN4NzBEUnhZUDE2aWpP?=
 =?utf-8?B?anlxR0JnYjlUWVI4WjRNMTBpQnQ3WkR3VXVMOVR5T2RTMGxSbE9Ya3ZHVyti?=
 =?utf-8?B?eEcwY2dzbUVRQlMzM20yM0piQXBDb3RVenVJdy9UWDJyT2ZNRTN2TTZhd0pL?=
 =?utf-8?B?azhjejI5YjBPT2p2N2wvSFV4VTBCWDV0ZFRxc1QzM1dBSHNkQ3pYK0w2U2NR?=
 =?utf-8?B?T3RhY3B4c0swem1iNkMvLzZwVWwvVkljK091c2o0cXZUVTNTVWNvU0xFRWtG?=
 =?utf-8?B?ZEZkYVNpWVBJR3U2WEJncTBUN29tWkVBam5IR1Jjdmlick5PbDlWU3JIM05v?=
 =?utf-8?B?YVBQcmdvZjVVcTdGV1R2VWlzSDArUjV0S0pNSEJSMFlsRkQ2cCtpL0Jrc25t?=
 =?utf-8?B?dXF6cWxXOWNmN1oybTJHdEpqNW9KWlZCcG1JUGxPbG1Yb0tsNGZoR0Y2T0FE?=
 =?utf-8?B?NlRRZEduZHVIUUVSSmZ5WGZKdHhqZ3ZIUWRRcDJ4RnJyczh4MHlwWTlBWHMy?=
 =?utf-8?Q?7ywebLciArinIbLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c631bf8-2e2b-43f8-bff7-08da13f20ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 15:12:37.4307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wAeJaqPMOWNEdXVBhNrFYhkOFCZSeicpAXXdS2+HbEg8wArUk/b01X2MCkt4ZCtI/ASPEK3VdvcKK9oHhzF0ioJeNL+hu8s6Xaw0jc7Epyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6437
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzddIGR0LWJpbmRpbmdzOiBj
bG9jazogQWRkIFI5QTA3RzA0MyBDUEcgQ2xvY2sNCj4gYW5kIFJlc2V0IERlZmluaXRpb25zDQo+
IA0KPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA5OjI3IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgTWFyIDE1LCAyMDIy
IGF0IDM6MjYgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90
ZToNCj4gPiA+IERlZmluZSBSWi9HMlVMIChSOUEwN0cwNDNVKSBDbG9jayBQdWxzZSBHZW5lcmF0
b3IgQ29yZSBDbG9jayBhbmQNCj4gPiA+IG1vZHVsZSBjbG9jayBvdXRwdXRzLCBhcyBsaXN0ZWQg
aW4gVGFibGUgNy4xLjQuMiAoIkNsb2NrIExpc3QNCj4gPiA+IHIwLjUxIikgYW5kIGFsc28gYWRk
IFJlc2V0IGRlZmluaXRpb25zIHJlZmVycmluZyB0byByZWdpc3RlcnMNCj4gPiA+IENQR19SU1Rf
KiBpbiBTZWN0aW9uIDcuMi4zICgiUmVnaXN0ZXIgY29uZmlndXJhdGlvbiIpIG9mIHRoZSBSWi9H
MlVMDQo+IEhhcmR3YXJlIFVzZXIncyBNYW51YWwgKFJldi4NCj4gPiA+IDAuNTEsIE5vdi4gMjAy
MSkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjItPnYz
Og0KPiA+ID4gICogUmVtb3ZlZCBsZWFkaW5nIHUvVSBmcm9tIHI5YTA3ZzA0Mw0KPiA+ID4gICog
cmVuYW1lZCB0aGUgZmlsZSByOWEwN2cwNDN1LWNwZy5oLT5yOWEwN2cwNDMtY3BnLmgNCj4gPiA+
ICAqIFByZXBhcmVkIENvbW1vbiBNb2R1bGUgQ2xvY2svUmVzZXQgaW5kaWNlcyBmb3IgUlovRzJV
TCBhbmQNCj4gPiA+IFJaL0ZpdmUNCj4gPiA+ICAqIFByZXBhcmVkIFJaL0cyVUwgc3BlY2lmaWMg
TW9kdWxlIENsb2NrL1Jlc2V0IGluZGljZXMuDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSB1cGRh
dGUhDQo+ID4NCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svcjlhMDdnMDQzLWNwZy5oDQo+IA0KPiA+ID4gKy8qIFI5QTA3RzA0MyBDb21t
b24gTW9kdWxlIENsb2NrcyAqLw0KPiA+ID4gKyNkZWZpbmUgUjlBMDdHMDQzX0lBNTVfQ0xLICAg
ICAgICAgICAgIDANCj4gPiA+ICsjZGVmaW5lIFI5QTA3RzA0M19JQTU1X1BDTEsgICAgICAgICAg
ICAxDQo+ID4NCj4gPiBJIHRoaW5rIElBNTUgZG9lcyBub3QgZXhpc3Qgb24gUlovRml2ZT8NCj4g
DQo+IExvb2tzIGxpa2UgSSB3YXMgd3JvbmcsIGFuZCBpdCBkb2VzIGV4aXN0Lg0KDQpJbmRlZWQg
eW91IGFyZSBjb3JyZWN0LiBBcyBwZXIgbGF0ZXN0IFJaL0ZpdmUgSHcgbWFudWFsLCANCnRoZSBJ
UCBpcyBjYWxsZWQgYXMgSUFYNDUuDQoNClJlZ2FyZHMsDQpCaWp1DQo=
