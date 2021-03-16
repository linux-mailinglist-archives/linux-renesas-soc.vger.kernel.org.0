Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4733CE06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 07:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCPGid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 02:38:33 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:19136
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230020AbhCPGiF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 02:38:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOePXiQPwQuQwT+nysbRQlERUgK3Hz0ZcMrnmj3JWaD4pcPM9+cbktPIoSxeEViD/xDwihnVUGoGxwRcDcOXPVsbgH4StO+3sFC6/HMSkqvV6b196TTTUef+OiIEXfkAWqFHO/WbGo5k//bBREcVZ7xTwXJq+jaP16+6Mx15F7cjs0zgNmB2SdP76aajy/XOdz6xK9opaP+lz0NuSnAbNleGLJ92UcGgQuEC//CVX8QwyJ1gee+jq/kARz1QmQbfST2d4oBg5lWBNAO7FRDyeoBw0UGUxh/9LAbFMIpAuyphk37eAdsw1x4T2Ww41I8lzdorQDTue52x0ROEflUTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBCyEqNgYPJIwNeqWJpYxCkC73VIfqjnc+em/NZ4JzU=;
 b=ZSwgu81sFyCu+6X81q2J4ryGBDZ1tCY4Blm+2KdVb1/Y/DtN/UZ1g0er7Br9mI2tKZAIuZ2t1wLmDohgAngXJzDaGvcXIZM+dkjem0kPUPOOyTrZVILnEY+e9z4y4tk/e99Yel7O6TehiY1RcLxccl8OR7t+stfDu0I3C8PyGhgffHM4OKXgKlXx0+ZYftIm2e8D9cvjXfPcsVw1Qdy3Hr0gtpDptvz71hdrukPEaQlzG/z/AwaLxSZu4mXaujMD+2rdNj/VG93NafCNqp+Kw4ye+h5hNioxuf/dBXJQZO6m428hHnduELALA9vegzaWgAja+wjhx++6aAHW0Q8vvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBCyEqNgYPJIwNeqWJpYxCkC73VIfqjnc+em/NZ4JzU=;
 b=W1QSrwKGjTGKGsqblgUVPBp/HN8aQmWPPZk9X5eKdxSOP0eealtIcVJIxwsw7X7qQSdvWkgJhMLX98uxLiBJuRxy2Z4sXn0Y3c4r11IGv2W773dA8blKuah7Vj+tB3kVPkmlKYq40GxHultS0n8xHqx7CzIGLXLIv4v6Q5WVMTg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5405.jpnprd01.prod.outlook.com (2603:1096:404:802c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 06:38:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 06:38:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] mmc: renesas_sdhi: reset via reset controller
Thread-Topic: [PATCH v2 0/3] mmc: renesas_sdhi: reset via reset controller
Thread-Index: AQHXGavWAVEjBLzSCEWIRJVFCiAX6aqGKg1Q
Date:   Tue, 16 Mar 2021 06:38:02 +0000
Message-ID: <TY2PR01MB3692AFFDCA9D12B0CD2374FED86B9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 733ff465-cf80-40d6-0e4b-08d8e8460ca8
x-ms-traffictypediagnostic: TYBPR01MB5405:
x-microsoft-antispam-prvs: <TYBPR01MB5405733DBD0F585920AA8717D86B9@TYBPR01MB5405.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pE+2X4MPPD2L8v6c7gAHa7wGHgt7HR/7AyzI12CRuGnLoZww8H2UvC+N18vwxG26OWnYthEnFbruaZDsFrkqQtorSSgR+qHc7kc+by/w+IHZ6tGA1uKKAt+3dQfP9qnhymabkMXEtjpozQQxt810GRPh6KFyjnkLkA1thCaS5OFVvt6LI3+BRL/tfhEjhnJuO3IfCI2rG2N2cwYD+0c/UElSco2AXlGQlaeV8hvkcjuELKAX+TYx/t7m7ISo0qfezrv/lkBeyhvRwJ6s+corblk371zgjybrg9oOJFCPQxVGXF1WXzZWTefpBE+0NG4mV1Hdqd15i8paSUYRyvctQTul4Q13Uw5/TpLkU3En8jfHxF878vClC35knRHvcdsOAvgPeoD0yQCV0qycT9WevVcDF8ikASdI+3ZKFnKiO+SoVYjOLRhheMFC0eRnTIOMray6CsaQoQB1T0wV/cBSevGPBB9WlZLDcS4q3Zl83eiLlouLBE7SSd1fNv7pnbqQLs1DpCRd8Mo+kpeAY4/BdMDVbLVUn6zfphJvurqgW49H7+esJZbVORcT8g6iEsJu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(2906002)(8936002)(7696005)(8676002)(55236004)(55016002)(4744005)(9686003)(110136005)(6506007)(71200400001)(66946007)(316002)(186003)(4326008)(478600001)(5660300002)(26005)(76116006)(66476007)(52536014)(64756008)(66556008)(86362001)(66446008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aFVvNy9rNDcwOHRhUUk2YWxWRlg1Wlhoemx0UTduUlBKMEdKT3RqK2xlRzNy?=
 =?utf-8?B?eHRrclhNNFlxUEF2S3VIODZxUVJvRitML01zeXRHSE5RNzhWK0c5WHJWL3l4?=
 =?utf-8?B?aVcwTnVmZGV3U3BkelRQZkpibE9uWi9hWnRIMk1PVlcwb3VkeVc0a3lmMU5w?=
 =?utf-8?B?b0t6cnArR3FRekkwWUNHSnUzNStwSlpmeVBGcWx4Y1hZYjhmT25WRVhHVGJw?=
 =?utf-8?B?Y3lnNFNndkZadGJxeU56aW9mRXAvS1A1dWk1bWZleXBKeGVoblNTTTMvd0I3?=
 =?utf-8?B?N1dsMnAvYlVsWHh4aGFoMWgrYXNHWEVTdUQwNjcwcU1MYUFrbDlDL2g1dHZi?=
 =?utf-8?B?S3dDV24zWmpMRWtRN0dnOEJ1T2UyZ2VENjN2b1V3UGNjcWhxNVhjVVYyQUNV?=
 =?utf-8?B?aStFM1djRkRtUmhNZFNTWjNWYkp6Q0JzMHpuelZsNDc0dTU5YU9JcXZ3SHJC?=
 =?utf-8?B?TG5DL0RIT3FzQXFjam5NRTFEUkpMekN6VGd3Rko0Y3hVS2o4ZUcreS9sVHRy?=
 =?utf-8?B?R0xBZ3RIUEhDUW5BK0tLVE1PaW5kVEJZb3ovOXFleDJ2MXIycm93WFhBOXBC?=
 =?utf-8?B?blVFYzVFRVRia0NubkN5SEV0elpTZ3lSbFJRSHdMUFloZXNCS0JOcEJVWWdC?=
 =?utf-8?B?engyZU5yTGNVY3h1cjQzNTFtOXVERzlCK0dGa0FjejNvT1B2TWhmeW10WGd2?=
 =?utf-8?B?STFYOG9uT05pUWJDa0IwenJlbzlqL1JNckszSzRVeHVGQ0YwamlqRE1tWHNp?=
 =?utf-8?B?WUR3YkpPbExKN0xXaStnbm54djY1TVZjVUdrak8wT3JtZE0yU2lvMWpJajh4?=
 =?utf-8?B?U0NTNjVHWkh4MFAvTFRFa3hrL2Qxb1hUS2JJSWkzc0hmVENwY01aSmR5eVdt?=
 =?utf-8?B?eEFkaXl5cTU1cWE1OTdtYmVBdnQyNmFGMmRhQzBXS3ZDL0JBKzRiV2NRdXZw?=
 =?utf-8?B?RGpBZGNJQ0ZRaUFPS01ienE2cVhTYlphbk50eHdJdy9EdGJqNTQ4d3I5aWM1?=
 =?utf-8?B?bWdpV29IU1FNdlhXNDhjakUzVUptVGVXditMRG9SOFhOKzdYOUxVWGVVT0I2?=
 =?utf-8?B?SmlmYlU1UzJuM21vOVN3eklrdjYvc3Jtek1zVzRnMnhrd1ZUT0h3Vzh4OEdv?=
 =?utf-8?B?RWNSRklIdkFIUDNrbUFsM2MrQThzVldReHEvc0FlOGpTTURCdE9RT0VnMUFP?=
 =?utf-8?B?SXoxZ3FBYlMvaDZjUGMvUGZuOVNLMno2RXh0bmF3NyszTDROekZRZ3prKzVB?=
 =?utf-8?B?VzhWeWZsZ1FVUGE0d21DTkJoNTdGQytoOGxvZEphTzI3N2JSN21IemFZMWZD?=
 =?utf-8?B?SGdHUFNuMmw4NjJoTUNkTkp6dlRnTTNxSnpkWW1ENXJDWCtMVHpwU2Y1Wldz?=
 =?utf-8?B?YzlXK2NjeVlWMXh5SEpPdFdiQjdPd0VqTStTMnFzY3J1bXBDSTVtSWY2cnR0?=
 =?utf-8?B?K2JjQ0kySGMzWDh1Rm50a3JzSVlaTXEyeGdUUmxyaWtPRU1YRU5jZEdHbS93?=
 =?utf-8?B?ZktSUkNMTDNSYVNUenRDZWFxVFI2UHhnaDVPREhaNWN0UjhTRGxsSFA0UXZY?=
 =?utf-8?B?V0k4TnpWOG13WWtMM3Fodll4clQ2NmZoWmR2N3hUZlB2RHNoaTk0dms5cWlH?=
 =?utf-8?B?S1JjWm53QXpDa1VDa0R6Wm9Jb2d3NVA5L1NJSnFIWW1uZFF1T04wdUZvc2l2?=
 =?utf-8?B?Q3ZBbnViOFh2WVUwVnZjNmRTblAwS1JneTFPMXhNNm5lYTJraU9CUjkzdERE?=
 =?utf-8?Q?6vlQUILnDfwa2tGCUU4T/u8hOtxi+2dTNv0y2Nt?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733ff465-cf80-40d6-0e4b-08d8e8460ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 06:38:02.7981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlBgI29LDGZh2ajx5W0Hpi38Ayweb2hkgYLL3s0CCHUlXy4aji4oD6vT2IdurR5+gGccHTn3txbjMtWUWeeF0NgTa3PknKugmF659p5YvElXNJaTq+5RzBu18olcZ70Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5405
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgV29sZnJhbS1zYW4sDQoNCj4gRnJvbTogV29sZnJhbSBTYW5nLCBTZW50OiBUdWVzZGF5LCBN
YXJjaCAxNiwgMjAyMSAxMjowMCBBTQ0KPiANCj4gVGhpcyBzZXJpZXMgZW5hYmxlcyBTREhJIHRv
IGJlIHJlc2V0IHZpYSBhIHJlc2V0IGNvbnRyb2xsZXIuDQo+IFBsZWFzZSBsZXQgbWUga25vdyBh
Ym91dCB5b3VyIChhbmQgQlNQIHRlYW0ncykgdGhvdWdodHMuDQo+IFRoZSBzZXJpZXMgaXMgYmFz
ZWQgb24gbW1jL25leHQgYW5kIHRlc3RlZCBvbiBTYWx2YXRvci1YUyB3aXRoIFItQ2FyIEgzDQo+
IEVTMi4wIHdpdGggd2hhdCBJIHRoaW5rIEkgY2FuIGRvIGxvY2FsbHkgaGVyZS4NCg0KVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2hlcyENCg0KUmV2aWV3ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCg0KQWxzbywgSSB0ZXN0ZWQgb24gUi1D
YXIgSDMgRVMzLjAgYW5kIEkgZGlkbid0IG9ic2VydmUgYW55IHJlZ3Jlc3Npb24uDQpTbywNCg0K
VGVzdGVkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
