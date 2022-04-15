Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBBF502657
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 09:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245357AbiDOHr4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 03:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235169AbiDOHrz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 03:47:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0107B540;
        Fri, 15 Apr 2022 00:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muhTtN0EBNPxJKUIe5IMNVYqO15lRXtVCOSNGDE6wD/IJpH/ZWAZi0PLx5OijYoTLvUqnuDxIuCqtz2dSJ7nHp4kW29bYkNtEPLHWqGzlFjeikkW4NZo11mUkYfI6fZe0BDNh0GTsqxOCQBqgbU73ROGy7k58iMnaR+QdkFwJ3YaobyixvB4Ln5YL6mgdLCn+Z2MZlyPzIFnzyIoOTgEVu7NVtNfWszP+SK+n/UqFlm65tQWOpspsd/+XkLWfzN+YFYcHYH16xnXRXaJdGv2hP8ZQ0tKbt8Wbh2sq0FjBMu3po3631oqMkUFEQZNoyfjz1VE8E4g7SPt7d612Co76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmV9f+6nYUuw2LDks05Jl3v5cuyFJ3VBiTALlGU/rXo=;
 b=a5Tr4hVFxrpY/L84070UX8eR7cZT45LXQfNfQU/+cUfQViEr2dZbaWgphy711f+yN73IFmRei3GQ0DXoa6Amrj05Z4OHnXHu5v5fIpVDyG4QB5x1DgCRzOWQlH/+nmWLKY9dgRTmd+yNoKsYDXVhUv2jFT2mX6+3WSONxOqiSGM3IM2QXzdkRw+QL04WxwZ3VC545G40i5lrQRTNI4rnKzLgpAF8T9bKlLxHVlm+52+q8XyXuyV8hssZ/uHKvcGKMxF9Xdpe0+sZ9+5z+j0h0vh3mu+Q4D6Oqk/SWSfWQWwY6woKnXSW1/0Gdk40LRjQnl2p/h1H4+PZErTDFEGNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmV9f+6nYUuw2LDks05Jl3v5cuyFJ3VBiTALlGU/rXo=;
 b=D+3XMjeY20Sq3cZSxzSGvTMZU0TOLJv9LbQpIgGBZ6g+ATZX8J2iR+xD+5FXUTerPHu0zAZOGZbLt8gedVXFWPDEYk6wMzpzyH083ztLKtzzrSVHH0rdRbBPzlKb8H3b680he2MjaeOLlCUbb4JWxldPUWuxX9/6NfywhzmwyzU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9526.jpnprd01.prod.outlook.com
 (2603:1096:400:1a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.27; Fri, 15 Apr
 2022 07:45:24 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%8]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 07:45:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@infradead.org>
CC:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Thread-Topic: [PATCH 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Thread-Index: AQHYTkAe2bP/bIrOo0qCqgHyt2tjcazwjGmAgAAM2aA=
Date:   Fri, 15 Apr 2022 07:45:24 +0000
Message-ID: <TYBPR01MB5341AFC795E746B85DA98D20D8EE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-3-yoshihiro.shimoda.uh@renesas.com>
 <YlkUo5fK2cFOCsAI@infradead.org>
In-Reply-To: <YlkUo5fK2cFOCsAI@infradead.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc11adab-7deb-427b-4408-08da1eb3e695
x-ms-traffictypediagnostic: TYWPR01MB9526:EE_
x-microsoft-antispam-prvs: <TYWPR01MB9526A94C44988F238A84E472D8EE9@TYWPR01MB9526.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lNt27c0Hknke1ROQTwlR2J+jsTbQulr416YUTScWLl/g7/Bv00bG3a/1HmDtSW2709meQ2D7KY2B+hk0oCL7cYmj6axiILawiPDP/OMIgc3q8sGCyAprGsZLGRMjkGamXiWxT9nKbs6JHhAyyxUKDTGTTnraEg8ccIjwXj2JzIsYgsqdGxHqygVUBsqKjWdRBGtoamIneUywqGE+woWyVzVfNJykXs1yA70F94Ro37vZfy6lFoYFYwVgrPtmh0lqzvIkWYLFVef69i099Pe4wLB+1wH0aHzDXGqXmPMh/XeUZoHDZILdEQ1oPd78lrCx8Ei2HHAQw1oh/nuW0+0WiHyGVZYlSFg4CTys9PFOeLel/HpMwx+NkvanSqE8LSPpCa1w3W91iw8MrTsQcFTMn740ZableR+OkzSFcZ8o8aQRzeV93YntDSnMsMB7pT+RaJXPWU3Y6QCxUNe1LuMHHZBloJESZss3wyc8WZGu5jkIk+LolEfrlfyQD4vHUClhH0TZlbtOo+h16YdN48v889q9X4mZSPcO78lY7nCgs6wfS+CMUuh1rXKrzK7/Y2U8+EvtWLDsvz0jETXXgqG81g/rMCn6SqH5DPUP00TPlPBNuz4uoMoEJ0Ek/3UgtFsd8qoiJXClGRDj3vZARU1lYnWiukEY77vzfI/rFnlAK1jroe5YYWxVwvF06MgPoUQ+X3sg/+ajvDo5lkkzXwZpdA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(8676002)(64756008)(55016003)(7416002)(508600001)(122000001)(6506007)(71200400001)(7696005)(2906002)(9686003)(33656002)(38070700005)(52536014)(66556008)(83380400001)(66946007)(54906003)(38100700002)(66476007)(6916009)(66446008)(4326008)(86362001)(5660300002)(186003)(8936002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5xvEZNROdXDJp/gZUA4dD0tkZanj5cuqFFdqW98qAcFaRfV2nbSclO19Ohjg?=
 =?us-ascii?Q?f8P8MqxLhrCLfvn9ZemPh5ABHPQ7LGGtnx2mmMvDrb+47tEPwSngehZ2WgPH?=
 =?us-ascii?Q?/q1VU3ldssP4DPcJB9fdLWh1VoQ+d1yXvspY3F3E2xVfZoLBZHtQEAXr9jHk?=
 =?us-ascii?Q?6d/OhEZfU8oow6423w+5KQMALTpFg8LPjaZQEN4ahBxR6dV+Itoh+K0EDxzd?=
 =?us-ascii?Q?XI1p4B/7SUgHzVuXA7Rg+eUkaVhRdZp2sgUnGC55agoY3I2bH+61ZJ+jWj3k?=
 =?us-ascii?Q?TOZEt3h+l+ot33ls1a4534uPPiTWdLtAESO0/Oy2g17ZqHJ0Wemw9sZkOPlI?=
 =?us-ascii?Q?HQAlI0w09a02yxcaMX0j32bHkByFlHTv5miVUX+dUaXpSH0o6ZUNZDgLn070?=
 =?us-ascii?Q?4XiPbQeRYkgvTO0VaCzRvKeeUyrs8HbFUCIft1+Ior96dfyFN7ZXRtT5V2uU?=
 =?us-ascii?Q?d9TcC/8iEoFpaHPQ2qaXLEuV+m00z39iqv/3gtMNWLgc5xMR4RxFK88E4vFw?=
 =?us-ascii?Q?fwMCFoJP5AxDaDssh17sPnl30xIidriqr/yN7zoZshiztWFctnY56BrbjDHG?=
 =?us-ascii?Q?QDw2uBlax+gqb2Pw6DPsoegiFclyt/N464NsXCm2CYJbQba4tVXrBWUgHIw/?=
 =?us-ascii?Q?+Ge36J/9rzc6fiqMmRWaxbk16vqRmefZVnWkGiT6W7omfXslBULcEZHsadD4?=
 =?us-ascii?Q?r56PF0PkPj1w9XEOT9YGU8q7D+z66iv7/yZdCyqhVq2roq5pm4wTT1+oKyFi?=
 =?us-ascii?Q?ZINH7RCSUrz2V25Cf1gDCaO7AValbWPPnMTTGfHlPxOipYQBbeKCXPFhPS/c?=
 =?us-ascii?Q?LgOwshAG9e2QMFbuhNnFi/0Z8kmbDBQ1lAbGVLPC4EDqIbJpQMjkwQ2QDb0w?=
 =?us-ascii?Q?ikif8U+VOHvRKbS45WrziqAppqB1U2WsGa8iPy5nQG0NOGmmKNN/RPIkalYn?=
 =?us-ascii?Q?lUYOZRIXJnyIYwrCtCpzg7Ak5QX5CIS4PCp6ib2TUvq/XA4Jm4aVyJ7yOhIH?=
 =?us-ascii?Q?PaT1bqWiTRtYshCpU1NiLoGVD9m32Wd+CeYkfSvIw2oyOJ3Ad/TFKnp3ypSz?=
 =?us-ascii?Q?bcwsjevH00onQnQGpdzaO52dAV/ogv+u0HUPsL0XNRnfYv473lNZuMCohsnF?=
 =?us-ascii?Q?Uzd79zI4DKHl0tjmvtsooNMFTAe1A08/TI4hPVlK//fiEgPMxLiHGwgvANVH?=
 =?us-ascii?Q?jO4h1LclB0uvFpQ4nDxMoaMKVcyZhGu8E6+ipZY9eFLD8VnPGCWCeDA2tJ7R?=
 =?us-ascii?Q?MevfZ9rjEUk4/JAll77MP56pyLIkO8WlyKajbp940kUi0cNBPglBMy87/CQI?=
 =?us-ascii?Q?vC28jajLGToerFmhy7Wl2xgBURj7VEoYIANEzwo+qAhZoykGb2awmNYUte0c?=
 =?us-ascii?Q?f1igC+eVqcO45gYhaobLW6zJgclAqo3jnscSohS+4VYJjexFJXsSbaTiWwKP?=
 =?us-ascii?Q?MWU+0ngwa43C/LX8oieVE5Zd3v/9RrSOzJI5EVlzdMkUrZVtXOrHF5WdbLsq?=
 =?us-ascii?Q?84FDk5LZdOv4eDL2rrUorxTgrv1UanRYsPFxKnZ6C8wWnjrAQLnp7YWFZAbv?=
 =?us-ascii?Q?OlJgU9ec+h/2/UVY+8SqG7qIe7WCcVPntD0uLGr7Fj0Fh/rkTGPYHMSB5d1E?=
 =?us-ascii?Q?FZiPxLu/m6Q2Rc9/ImU8lrNoH76qkfWOt3VAcAYUQ3bp8jAj02LuKrNKp3Io?=
 =?us-ascii?Q?g/P7T+uZSNMmbwDxITYGsg63uvzMCPEgNN7IegHe/BLWimMT3FsHdGQWMSky?=
 =?us-ascii?Q?27TytVVUUoekMhaKcvyyYiWVsz9yt0ztCSul2v6N1QR+6J2jaNl5qXtkDxmE?=
x-ms-exchange-antispam-messagedata-1: tHNC6BJvONSH/7/HFoGihIZod3WE3yYD6C0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc11adab-7deb-427b-4408-08da1eb3e695
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 07:45:24.2399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T84AdxDhGbpSf9PKuEl2LBn5HxeYkwvkhnKx25Zf6F2TVeyczrT+fAEdXHcDbRPHCvlyCIDI5bcyQqMu/UvjEID7AUYPhVUmm2cFt/QnBBLtivFyPX59pK+GwGy/M+tr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9526
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Friday, April 15, 2022 3:46 PM
>=20
> On Tue, Apr 12, 2022 at 04:36:42PM +0900, Yoshihiro Shimoda wrote:
> > Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS for a broken host controller
> > of the 64-bit addressing supported capability.
>=20
> Why can't you just clear MASK_64_ADDRESSING_SUPPORT for this case?

Unfortunately, the register (REG_CONTROLLER_CAPABILITIES) is read-only.
So, software cannot clear MASK_64_ADDRESSING_SUPPORT on the register.
I am also asking a person in charge of hardware why the MASK_64_ADDRESSING_=
SUPPORT
is set now, but I didn't get any feedback yet...

However, we can add the following code instead. Perhaps, it's better than t=
he current patch?

---
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2201,6 +2201,9 @@ static inline int ufshcd_hba_capabilities(struct ufs_=
hba *hba)
 	((hba->capabilities & MASK_TASK_MANAGEMENT_REQUEST_SLOTS) >> 16) + 1;
 	hba->reserved_slot =3D hba->nutrs - 1;
=20
+	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
+		hba->capabilities &=3D ~MASK_64_ADDRESSING_SUPPORT;
+
 	/* Read crypto capabilities */
 	err =3D ufshcd_hba_init_crypto_capabilities(hba);
 	if (err)
---

Best regards,
Yoshihiro Shimoda

