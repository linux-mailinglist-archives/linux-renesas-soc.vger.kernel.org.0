Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9CD512BD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 08:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244434AbiD1GtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 02:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244410AbiD1GtH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 02:49:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465A97EA10;
        Wed, 27 Apr 2022 23:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6TAVK8KpBCFAEaqApEPhsz/4pIEQuE8iHoJvEOWyXryRg6CusMdVrhrxQhLba+sINrRLWpg0MVNn9lrwgsXweRsPCdjeDpuOLtsitoQ05STBloVsefZlgu8larBjxBTwcHpz7sghzH4N89r5Ek+HHU4vvpFtEf52nysEkKziT3yDkXOZ7ssg7yor40gabIXMIAN50V9YuM40Rq6Rp4nubhIHCYmK/7QhjMpWPI/VrozVl7vOM9LyAB1myQTCE1EqAsuKCqaLuFPmods3JEX+Y+uImXA3YlXLn2X7PzAsss6fHGcnXhmRheMDmLw9hblrly3HnwSvSXIibZLGzqtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qq+3Ov3cHwO2vcexNfhUdGEZsAls9f/7237GoiMnh4=;
 b=DySZucPqyCcTZT88Xuf1MfGGgX4zgLRZvG6Mb/bLaglQkX7WWUdS3CUUx6x37MN60RcU+nmrjMbHho4K66YhgXbDyVkw2Eah6XjJ9W6GOTDi1h2HZkXBAFF92CzQsCPMjyoU8K0LyRrvkgYbDr/nPgPUQ6q763VQ83mDdfjaBxfXGBN9ybDJASpbntTG5pAJ3+h5EWt7MJYyDBuwVbqAxl70m6J98ie1aKk3UJ1Xy6QE0hO/qPqRyF4T5+BMTgojJxUseelxSHrrd9qeNoOPd7bbNEvfg9ja3rZTonBd3AaFiN94nucs5xd7WbC40Sg+JQ6I9WyqjqdGzOOtZ+bN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qq+3Ov3cHwO2vcexNfhUdGEZsAls9f/7237GoiMnh4=;
 b=Az06fOSPfRxMT+nmg6zTc/HCfV6aAWAOC2JIHmlBSyI8rZ4OIi6dtDynJaY6CY1+T/cF3/uITOGWP0OkJysUt8LG4GxrjZIFlyU0D6VKNt+xgPoaAaIGjueh8rJNEPcXeDjgwKsATOfKEXVU9AOevzOTpvSKIeFWhoSTMGr61RY=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY1PR01MB1561.jpnprd01.prod.outlook.com
 (2603:1096:403:3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Thu, 28 Apr
 2022 06:45:50 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 06:45:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Thread-Topic: [PATCH v4 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Thread-Index: AQHYVGIHXFiHKr62UEWvtssov80uI60Dx4IAgAEmKnA=
Date:   Thu, 28 Apr 2022 06:45:50 +0000
Message-ID: <TYBPR01MB5341B5236609633655ADF75DD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420025450.289578-5-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXn=qm_gutcq64y+XCa=CchKPqPnZqoc7jMMjcw-G0vmA@mail.gmail.com>
In-Reply-To: <CAMuHMdXn=qm_gutcq64y+XCa=CchKPqPnZqoc7jMMjcw-G0vmA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcf23586-df1c-42eb-1825-08da28e2bb95
x-ms-traffictypediagnostic: TY1PR01MB1561:EE_
x-microsoft-antispam-prvs: <TY1PR01MB1561BE7DD0145879C1EBEC7ED8FD9@TY1PR01MB1561.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wzdVU3dY43KlzHc11v4xYpPkYSd5xJEcEOlsd0jey0jotlKK/r6H0a6RQgB8mr3l5CFU1JA1RIo8szP/Ul1R4JAFixlpnGurQcbswLBSYt9vUGX1x/8s4804hLBTSCZFDSpBMl7N5hUOTqhr+sUNsF8ZlaygkMbt0D1aDuc4p2yxolUwHM1g6aWp41imJ4TMabZs8wctTC9JsTun4hd3DqE2Pq98uJjwLND03XXTO/6rh0XSnwH965NIOPpSFWe5XJWh7PxHxWNNWihvgL0b4NSW987qvy89muEOLt4PhrIW05RPHuyIz8u+v1UjruQ+1R1IMuOH0H+4ydeTYrth8WMkrXbxlxahKtHNt03HsYVMqD3U8MsAiIka61DPW/39dHbIhymPM4M8I8XQ+9Dx7NkzaAvMwY4K1aSrOdYONJC4394gO+S+/SkNNJZjXwJwpxs9sz2oDKuY7flXrD4+mnqlEIicEQXZslGL2jFfETHWVvNuJ9BMM1LpPZC0ZNRiOYaVpW+N/M7DScXvuvlB+uMAYu8n09+WB/MMnFXNCMuG5AcNvig4l6yGBvghO7cMpKMAZM46BRob5K5abu5e/m/UMsHeC82eOI1Ok9m76unCxreVT9UlOIy6B6bXpYYguKOGalT7WV9444xxbP4ord2PtWDokA+XIt7ukh2uhFchna2Z8vX4lhn6oBzsCAm2akhyH2ujCXILQoPSIB8ilQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(71200400001)(54906003)(6916009)(33656002)(508600001)(66476007)(316002)(38100700002)(38070700005)(4326008)(122000001)(55016003)(5660300002)(6506007)(9686003)(86362001)(2906002)(8676002)(64756008)(66946007)(76116006)(66556008)(7416002)(66446008)(52536014)(8936002)(186003)(7696005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUpKTFIzS2hYNFBBaStldFI3WENIQ0Iwc3Y2ZlhiQXY4S0pQaS85Y0ZVRmN4?=
 =?utf-8?B?UHVPQlpOTHc3bWFudEp5aEhZdTAxTnB5d2pKK1FBY3lrWGhvSThPZVVMa3Yx?=
 =?utf-8?B?VzAwWTZodGwvOVJhdDhqM0k4MVZyWFdQUkdQc0VoSGRhTThQMHZqR3VZU1dk?=
 =?utf-8?B?ZkVHTDBhalRnZjYzdlplODFVSG4zRFNrTnU3UDVJdjFMdTRMNGVSekZqeENx?=
 =?utf-8?B?cHpVUnZCNFBGblhXVzZkb0grc1hOZGdjL2ptSGFBSHdDS3Jod3hzeFZZR3Fo?=
 =?utf-8?B?OWhRRjhCdU9VMkNncjVPVlBTeUdiOEJFVzZPVEF6MDZJOW9qNzBWbUNNM0Ry?=
 =?utf-8?B?ZTBzM2tqMWR0cHpxZTZ2azJpSkJEaUJaK3BXZWRuN09KazVtVFgxeVdnUmps?=
 =?utf-8?B?ZjhMTkJjajJNVExRRnFlbEpKSTZZa0JUK3dBV09FTjJ1Z2hjZk8zdE03dlg5?=
 =?utf-8?B?dUVuMTJtRXZhbWIxOWEzblJGMEN6Sm5ESmpNMlFoRnZjek1sa3BzSDFERU9G?=
 =?utf-8?B?RWhQSWorNkRMWVJmVzQ1RE42WTNuZTl2U0lEeEc3K2xNNVFMUU4ybzczWDFh?=
 =?utf-8?B?WEtEcmtSclRBVVVPQUw1RWZBdEpTU2tYMUk1N2JPUjhvMFlsbHI5ODhVa1pL?=
 =?utf-8?B?akpqNDhYMWhiQnNOb1lMOWg3dHJ1Y3ZlaWV2ckt4ejFLQWpiZzJoTlAvRjZT?=
 =?utf-8?B?YmFVNGpxeXZ5SWNudXRLbjdBWWtlWjdmT3hqQlVGbjh0emdDMUQ4YkpYK0VS?=
 =?utf-8?B?WFFhdERPTnF1TlRBaDFyd0lqL1RpdzZyaDZTMEtNMTZPaEFqdkNlTWNTa2JS?=
 =?utf-8?B?aTM4SVFKbmRlR3FUa0Ixd3R5ZExianpnNzBsek0vekV1Y0pFQ0FJZ2hvOEdi?=
 =?utf-8?B?OFJJclJ4SzQwQnh0RDdTay9vOThCbm82MVhYOGlTOUYva0d2NEk2ak0rR3BH?=
 =?utf-8?B?MnM1b01uNFpLWGR0MnZwSkNSeDFjcndLbGR0UEZFcGtXY2VhcDFFVjJRL01u?=
 =?utf-8?B?YW05dElFZ01Gb0hrZkNTMytrODdXWVRPRTFyTHZtZ0JnSWtWYVFlWkZVRTY1?=
 =?utf-8?B?V2NHbmVuZGZyanlybUVBTjdzam96b3N4NmFrQ0xwSUROa0RLdER5RW0wRzNL?=
 =?utf-8?B?blU3cVgxR09lSTVZT25WV2lIWU1nRlJGZmk3VDlLY09xMVlYNGNVcHZ2TWE5?=
 =?utf-8?B?V0pEUkZpTnZjb2E4TDMybEF6UUE4dFVSOVBaZDRNV0xWQnk1SjN1akJ2ak4x?=
 =?utf-8?B?LzkyTGdGcG81ek1Fd2drY283TS85bUMwRklRYkp3TnU1ZXpXcGRCbE0wbVRT?=
 =?utf-8?B?WGFoVUtWdG1mREVCaGZsMEl4TGtQNldtUjUzNWp6NEtqdVo5UElMNVFlSkhV?=
 =?utf-8?B?TDBBWDUxWVFHbHJ3RkhSbEc0d09XMVFjdzdoZEhGUkFmZDZzeFlpMUxqNm1z?=
 =?utf-8?B?QmQvU2FmaXhVR20rYW9WZlZaMkd0bkNpb1M2ZWxKM3l5aXpkVHNQR2h1bmov?=
 =?utf-8?B?cDBaV0tuQ3BTemh4N1hjTEorWXFuOEo2ejRhdE43TTF5SkNsTkkwNE5icEpJ?=
 =?utf-8?B?M1pxdUdvUEF5OEFPanZFZmR5eG9LTlhXL3V1S3J1RHRhSWJsYjFmSFlOOUxC?=
 =?utf-8?B?dE5ucmVsamxFZ2F1OEF5WUhEdjA1RjBtODVuUitObmVGUElSbnZsQkNua3lz?=
 =?utf-8?B?cDhDUCtoKzlzRlJEeTk1N0x6bGVuc1FpV0t4QmFKR1ExbVBPdlBSSkk0Mzgy?=
 =?utf-8?B?QzdwYUFkU0tqZmwvR0pVQ251WS93SzRRNXByTml3ZGN5RFNCb3N1a1hFUUFU?=
 =?utf-8?B?TlBFRWN1bTZXVjVZZFdXUVNzSjRDZ1pBT3IyUzJNNVJRQVBvMXRWTDc0cGNy?=
 =?utf-8?B?ZndNd2xKaEJ6MU5FZkJGQTZRQm54ZkdSbVVaQzBtL3Q0KzkySWhzS1JRWVpz?=
 =?utf-8?B?WXZpNFFrU09jRkthYUJna0dseGZoRVlmMTRjckxXc0dteHhqbStmTTdva1JT?=
 =?utf-8?B?bGRqeDFBWjVNTEZ6WXQ3VmNsd0o5UkR4eWxiVE4xK2FlMEY0bEYyaWtDMHN0?=
 =?utf-8?B?R2xmUGlYTzI1NGswclJFaDd6ZVA5RzMrV05adVFhME9SdFI0QXAwYUxGbGN0?=
 =?utf-8?B?QXRCTkZrYm1DYlY5M21kdzJ0UnE5VlJvUXdJVnFaVjZpaE5mSUU1R0dqUlA2?=
 =?utf-8?B?eWdqY3N3MzJCRzFvcW5hWVZPZjhBNHFIUVhMTEJtSDF2a0VJZFRGd0QwMUlH?=
 =?utf-8?B?bnlUVitOMldMQkozc2QrdVNVMmtHMnBKY1pHR0tTbWlBRXVMbUR0MFMzYngz?=
 =?utf-8?B?RS9zMkc5alJ0c0ZWUWZRTGZISURINXIweER3b0pDSlBRUGtWT1V5alFaN2l5?=
 =?utf-8?Q?UGq+avfZbyaI6+6hcyiIIjHkpGpGdo3asAD2c2No5iqb0?=
x-ms-exchange-antispam-messagedata-1: emtAu7JWp49iokTohonQ0F9LXQz3XKA/RgE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf23586-df1c-42eb-1825-08da28e2bb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 06:45:50.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1/OitjgAKAf0WRWrbcUphg9/WnBn02WXd6LNMRoKiUtS78reVQBF5QRpSKWRlRJyjB2YXeASeIe+8efFvxzWve3xtmIscbu8RFJohSMDownFrMKqYL3gG1jQQWGY8Nu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1561
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAyMiAxMDoxMCBQ
TQ0KPiANCj4gT24gV2VkLCBBcHIgMjAsIDIwMjIgYXQgMTE6MzkgQU0gWW9zaGloaXJvIFNoaW1v
ZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCjxzbmlwPg0K
PiA+ICtzdGF0aWMgdm9pZCB1ZnNfcmVuZXNhc19yZWdfY29udHJvbChzdHJ1Y3QgdWZzX2hiYSAq
aGJhLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB1ZnNfcmVuZXNhc19pbml0X3BhcmFtICpwKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBzdGF0aWMg
dTMyIHNhdmVbTUFYX0lOREVYXTsNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKyAgICAgICB1
MzIgdmFsOw0KPiA+ICsNCj4gPiArICAgICAgIHByX2RlYnVnKCIlczogJWQgJTA0eCAlMDh4LCAl
MDh4LCAlZFxuIiwgX19mdW5jX18sIHAtPm1vZGUsIHAtPnJlZywNCj4gPiArICAgICAgICAgICAg
ICAgIHAtPnUudmFsLCBwLT5tYXNrLCBwLT5pbmRleCk7DQo+IA0KPiBEbyB5b3UgbmVlZCB0aGlz
Pw0KPiBJZiB5ZXMsIHBlcmhhcHMgZGV2X2RiZyhoYmEtPmRldiwgLi4uKT8NCg0KVW1tLCBJIGRv
bid0IHRoaW5rIHNvIGJlY2F1c2UgdGhlIHBhcmFtZXRlcnMgYXJlIGhhcmRjb2RlZC4NClNvLCBJ
J2xsIHJlbW92ZSBhbGwgcHJfZGVidWcuDQoNCj4gPiArDQo+ID4gKyAgICAgICBXQVJOX09OKHAt
PmluZGV4ID49IE1BWF9JTkRFWCk7DQo+ID4gKw0KPiA+ICsgICAgICAgc3dpdGNoIChwLT5tb2Rl
KSB7DQo+ID4gKyAgICAgICBjYXNlIE1PREVfUkVTVE9SRToNCj4gPiArICAgICAgICAgICAgICAg
dWZzaGNkX3dyaXRlbChoYmEsIHNhdmVbcC0+aW5kZXhdLCBwLT5yZWcpOw0KPiA+ICsgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNhc2UgTU9ERV9TRVQ6DQo+ID4gKyAgICAgICAg
ICAgICAgIHByX2RlYnVnKCIlczogJWQgJXggJXhcbiIsIF9fZnVuY19fLCBwLT5pbmRleCwgc2F2
ZVtwLT5pbmRleF0sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHAtPnUuc2V0KTsNCj4g
DQo+IExpa2V3aXNlLg0KDQpJJ2xsIHJlbW92ZSBpdC4NCg0KPiA+ICsgICAgICAgICAgICAgICBz
YXZlW3AtPmluZGV4XSB8PSBwLT51LnNldDsNCj4gPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+
ID4gKyAgICAgICBjYXNlIE1PREVfU0FWRToNCj4gPiArICAgICAgICAgICAgICAgc2F2ZVtwLT5p
bmRleF0gPSB1ZnNoY2RfcmVhZGwoaGJhLCBwLT5yZWcpICYgcC0+bWFzazsNCj4gPiArICAgICAg
ICAgICAgICAgcHJfZGVidWcoIiVzOiBpbmRleCA9ICVkLCBzYXZlID0gJTA4eFxuIiwgX19mdW5j
X18sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHAtPmluZGV4LCBzYXZlW3AtPmluZGV4
XSk7DQo+IA0KPiBMaWtld2lzZS4NCg0KSSdsbCByZW1vdmUgaXQgdG9vLg0KDQo+ID4gKyAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgY2FzZSBNT0RFX1BPTEw6DQo+ID4gKyAgICAg
ICAgICAgICAgIHJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoaGJhLT5tbWlvX2Jhc2Ug
KyBwLT5yZWcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmFsLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICh2YWwgJiBwLT5tYXNrKSA9PSBwLT51LmV4cGVjdGVkLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEwLCAxMDAwKTsNCj4gPiArICAg
ICAgICAgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIo
IiVzOiBwb2xsIGZhaWxlZCAlZCAoJTA4eCwgJTA4eCwgJTA4eClcbiIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCByZXQsIHZhbCwgcC0+bWFzaywgcC0+dS5l
eHBlY3RlZCk7DQo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgY2FzZSBN
T0RFX1dBSVQ6DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChwLT51LmRlbGF5X3VzID4gMTAwMCkN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBtZGVsYXkocC0+dS5kZWxheV91cyAvIDEwMDAp
Ow0KPiANCj4gbWRlbGF5KERJVl9ST1VORF9VUChwLT51LmRlbGF5X3VzLCAxMDAwKSk7DQo+IChj
ZnIuIGluY2x1ZGUvbGludXgvZGVsYXkuaDpuZGVsYXkoKSkNCg0KSSBnb3QgaXQuIEknbGwgZml4
IGl0Lg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdWRlbGF5KHAtPnUuZGVsYXlfdXMpOw0KPiA+ICsgICAgICAgICAgICAgICBicmVh
azsNCj4gPiArICAgICAgIGNhc2UgTU9ERV9XUklURToNCj4gPiArICAgICAgICAgICAgICAgdWZz
aGNkX3dyaXRlbChoYmEsIHAtPnUudmFsLCBwLT5yZWcpOw0KPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiArICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ICsgICAgICAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB1ZnNfcmVuZXNh
c19wcmVfaW5pdChzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBjb25z
dCBzdHJ1Y3QgdWZzX3JlbmVzYXNfaW5pdF9wYXJhbSAqcCA9IHVmc19wYXJhbTsNCj4gPiArICAg
ICAgIGludCBpOw0KPiANCj4gdW5zaWduZWQgaW50IGkNCg0KSSdsbCBmaXggaXQuDQoNCj4gPiAr
DQo+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRSh1ZnNfcGFyYW0pOyBpKysp
DQo+ID4gKyAgICAgICAgICAgICAgIHVmc19yZW5lc2FzX3JlZ19jb250cm9sKGhiYSwgJnBbaV0p
Ow0KPiA+ICt9DQo+IA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21h
eWJlX3VudXNlZCB1ZnNfcmVuZXNhc19vZl9tYXRjaFtdID0gew0KPiA+ICsgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OWYwLXVmcyIgfSwNCj4gDQo+IEFzIHBvaW50ZWQgb3V0
IGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdCwgdGhpcyBsYWNrIGEgc2VudGluZWwuDQoNClllcy4g
SSBoYXZlIGFscmVhZHkgZml4ZWQgdGhpcyBvbiB2NS4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGlo
aXJvIFNoaW1vZGENCg0K
