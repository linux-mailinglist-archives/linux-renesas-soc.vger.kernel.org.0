Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509CB554695
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbiFVJrQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 05:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241768AbiFVJrO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 05:47:14 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8C2E8E;
        Wed, 22 Jun 2022 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655891234; x=1687427234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jXrxGWM+viMhlGKsoFPWmYX9bQgr6VNnRuDBptqFoUg=;
  b=l1Dwo7dbeo7vHb2ubynSIhb24uJahRG+1HIwz8zthuOMYhynOY2Y1f1H
   pLxUMlvQOGBc+P0Zzm9TYTjwrvwq+rDGbMlBAwLpmHnBNeygrrFsXy8wj
   SDklqVgpqy7NIUgtWe/oCaLxNlcWJPxPNl2/0YPLvvgJa0sN1ve0TzdLS
   QSOMarOH3CAlmCQBAfSfsO/GAU6eWeY7RIjgXUTpBG59fG/SO8IRTsk60
   /5xp/TmMwfdNOoThuo3XqaiQ0GN3HlzSp7Jbgy0TqAGS5r6GZYN0GidXN
   G7XiaIUaBhy4sbSeDXpD/Lf6P3Tam5IcTHv6dOZXi7tHv1sJlOaWRqF33
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650902400"; 
   d="scan'208";a="204562153"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2022 17:47:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/bRZjKLz/aekxSfvxjiY8iezA8chrU/NPdgz/Ah3j+8i0m3qxYa1JHfiyUzGGYKEqfOiLfzib9fMr7UOLKAAiY9KML2rl9Mmdrdb124eQqucPbhxlRz+uiiPgQEVUAK5s0UsKKsLBD1JW13g8bP4wjVGqlLAjq3tpP4rqcQO4mC/702LNKz1Jee96WkJyMiWuyI+tMHZ3njeFP1V3OwWd38y3ymKIV3sJBasJf/YMX80vayespY7EsHeFQA37l5w1wgqWK0ik5ozrWtPqNLX7p7JpFsypOr7N3y7paN2N1puGOT4wUhUJ7iRUkEpNHPTe+IBacRY+fBezXDubZGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO+kpQ/mVQfbOPCmASAxjepxSwufbLGnN6h4NmHGWBg=;
 b=dhBRCRh2VjG217LEpqRe+P8+oalcr4cUyN7EAX1ipCIeHa06606Pu22qMPL6xPX5F3wRWezGv0QPDVzDRKeh9ur29zheDImJsaUxFk3dtXB0HsBd7Y8XBlKnjSVDp9zDDZkQN5D10mEwGKECfAILKXkAv81vTW1cOySIW51xdRgJGbFYqBPlc63wgVaec0anCrmD69b/jGPNIRCfGzu0uXFLghN+QaCpTSPLYv74GdlTbN5nMC7f+PdyUcQS/9KhuD0p1/OFAbAfmSnyEBsFghE2L8Aj5s1VZvxxQ9Pm1Yl95uHnfeSJDAj9k0FgWA2ALGtV0uUCQOna33lRmNXOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO+kpQ/mVQfbOPCmASAxjepxSwufbLGnN6h4NmHGWBg=;
 b=MMsEj1Z9l44nm8NBS40ta5LW71GNoEjRjpC1tnaq40svlkDxF6j+wpQWnolnLcixTxT4uAMfxSbk5yufHNnWmRKu1pCOZKAicOyZ844IXqyYi8ZZRmE19XXGU0M5z6yWrVw+X/Tflx7TzlR4gELVNNotAWECo6wttY/ZGjNWrNI=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 CY1PR04MB2188.namprd04.prod.outlook.com (2603:10b6:600:1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.20; Wed, 22 Jun 2022 09:47:10 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31%7]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 09:47:10 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Avri Altman <Avri.Altman@wdc.com>, Wolfram Sang <wsa@kernel.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Topic: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Index: AQHYhYGQfGepPuvwykC+XkcnFWdRYa1a+ApggAAjuICAABEcIIAAAdWQ
Date:   Wed, 22 Jun 2022 09:47:10 +0000
Message-ID: <DM6PR04MB6575DA24CCF398A890129C78FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <YrLU6/jAZ5lGnL3p@shikoro>
 <DM6PR04MB6575FD5AEE828A184B3713D8FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6575FD5AEE828A184B3713D8FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75ada680-0df9-49bb-d55b-08da54342d7e
x-ms-traffictypediagnostic: CY1PR04MB2188:EE_
x-microsoft-antispam-prvs: <CY1PR04MB21888929A2022C8DED409E26FCB29@CY1PR04MB2188.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GSTD6j60chpmu8Rq9Ew+hO6Uw1L/c6WNK2ol8g6zIVWrXhSqcOw2zwm4gBVGU4u5MbuaYMVwbkwbDmWVxN0ld0lB3QQwQ6d+ixHngRg5kWzyZuCmObXD9dEURFTkQ9z+sZ/ffq2tA91yqNFPVfFBPzJeX3f0JWhIHrxyLCa7OMWGTTMbsvBH1B9ateIGurIXVSHECgqpdXtfdJGlfgYO9y9WGxUOyW1kBN5cSTeOkuGM1c7Z06Wz2tEh3sTE4FxA6beIscKKvm4uJI2Kwl7a96h1kYts36vr/yAXuXd5weTkwHoT3nnaw6b87SnKabMlJySakkU7GlVvE8EGNnklvIuMQkD2GW2UMoieO0JiO3J0rpAXrOKbEWOBpbJ3/P00qz0/7DlAd4O3sV3IMKo9xZ+vccgn1qzoTKal49dudMQHjsRFx9ZA7c5T52lTQ8TQqQriJreCZW2zpIV0CkkphFHxfF9N0nVrOKLId79S7Xwh0PxTCVqyCZ0o3ifN1NBFRVvVA9qBCK3/4lBTrpsTESHusTD+1zkoXe5qBY1dCJYCXfWfUyh73CJcLgW8ho3J3gZTlNKRuArO0zuEsktIOkHVjnQmbd0O6TrBwXQUsh+mwuNvkYOMCye6PGQXdMhA4iE/GDNW+pOb3+rlQJtHWUNp0c/PwQ8PLfsRq/J4g9zOZhJ4vjUxxSIfaDj0a2nOCH0CsjOsUmPJJ1032jIGwv+Eipu6JrDuCR5di9JD9ukh+5+twIW50+ovT/8OnA5ZWOwx1gONN1N1LwuYiGD+QQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(2940100002)(66476007)(76116006)(66946007)(66446008)(64756008)(54906003)(7416002)(66556008)(7696005)(5660300002)(38070700005)(110136005)(316002)(41300700001)(71200400001)(8676002)(6506007)(4326008)(478600001)(122000001)(8936002)(52536014)(186003)(82960400001)(55016003)(38100700002)(26005)(2906002)(9686003)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CkMDDV1JFwWg4NJl7nJKAZCBsdfi1MTX3Kawc/FReZ6dgtH2DQS8Kq3EcyPK?=
 =?us-ascii?Q?H0neOnRTYkEyYY6zECMnlfGfaxhL9+n/Krbrvb9UbjSRaVlz0vks1fl97hEP?=
 =?us-ascii?Q?ngrpdSszJTeTT+AGHGv8TuTsOuvXTaxisl4rKvhr//plOTjUcZwGCgxXWIqz?=
 =?us-ascii?Q?iuCsUFlrlxxrItEsFWmSr7DRJuBQjC7jRUoze8IyK0DWdxySfpTMgHEc/MNY?=
 =?us-ascii?Q?sE1vQek7pB4Pf97Iq8KGRQW9Agd6VaYX/wFEITqiqJlDnyBkILeWPjhyi4sc?=
 =?us-ascii?Q?lioRXqxGdx2uO2Ik/Y3QQPTy981ggayuZN5SF9FULEczs+/58HAALZ19Yvvf?=
 =?us-ascii?Q?0wLBTOV1v4741emg9Zie/dmAS1Ewyg94EjB9+HZjj6LCM7jCTtFenvpE9H74?=
 =?us-ascii?Q?WW3GwW/G3LJTswlLnvITeWz0kP+xEjiIBA9yfZvx5eX2+UxZJ9qJ1wwOaPXB?=
 =?us-ascii?Q?Z15BD0BZzsJdo/Hriu3JZ089NQEqXHCx/UIsKkvgtUmY4Brf9ht+DUTvibfh?=
 =?us-ascii?Q?iZT16Ns2Ei72zFoCWZo1sAERd7pAXpdn6fZUcHHLxhHB/XkRvsp9zb1kH2aT?=
 =?us-ascii?Q?g4nQC2yDVcKz+Sj8hJywvIL3e5X1xU9j67Qohqfuq3/ZTdhaSSO3n0AjE4HV?=
 =?us-ascii?Q?yTatXWPWb/cYR/rYjuFCDzRyB3yV7UYXKa3I6ewpUwUhZz10GjmBwaW3QLoq?=
 =?us-ascii?Q?nNRYXnEvlSxZEg0+bfYAzPjWwL9GEeTCehkpbNvmxpyyv/l7JENKPyig33lE?=
 =?us-ascii?Q?f8ptcNFCdz8rOhT+5B3l6TIZZxbxpEDtgfoXzoWIRsmsa4qAuCn6J57TeWTx?=
 =?us-ascii?Q?Y8RnmraOkO6BfG89rpJgyqBxUSm+x6gu9xFV28yvWhd5nxyoBg93Wq1RhnIj?=
 =?us-ascii?Q?69j2KAZHW7ePFaPfBMMzso155XUk1W3I42SFQrFA2bquteCipzE7gpsJ8weo?=
 =?us-ascii?Q?t3Z9DumzA9kqa3y0I2ctmGbf8oO7XsyjhABJIVZKTAiy64dJFzLDmSVPoG1h?=
 =?us-ascii?Q?H/999wbB9KJ5rhEtOBeqWtC2iYTCHk/NFTCdEDFgzLxoyWo3yKme8YcmV6y1?=
 =?us-ascii?Q?da+7yqe3iEuUhTEoUoXjWdxsAuKy6gLBd2rN+mRV592i2JXfetrUUU3d+HUM?=
 =?us-ascii?Q?0qpcbJmAohtuAe/zlKt0w7laZkt11Mt4G2AHtbX+Up4H9vehbeiREFf5jP3J?=
 =?us-ascii?Q?uGDkX09DmRypz8PFlyR1ZnvGW20o1fGhonor2WkBdg1YJsz4vJXLhW13lyj5?=
 =?us-ascii?Q?nYOzi+Eyx5boI5cKPT2gHqVEUaAG0E4IWacfhqZlnOOXrjDQri1NahfPKn2y?=
 =?us-ascii?Q?8fodWHvi2N6LlpRvFsuKYAzi+LWbHpKxeYg9WmCVIfEtCO56YNfiKYopfoAb?=
 =?us-ascii?Q?VghAIcK2gbxehsfr8Ra90YeKPy9Ew358w66bxbgXMByHjPo5Bjx6qnT8Kinc?=
 =?us-ascii?Q?AhHySQZtB20tJas8FRceFpS0/U1KNFXEHoyHTH1YnZUR4G6rkGkdabRw1yg6?=
 =?us-ascii?Q?ZMfckMqXcNO2/LhDdGLIfKjM5RU2ITELza8DAYHaDwufuXGBlK5ODPA2bP3b?=
 =?us-ascii?Q?rOvLK967L7aPqYQQ6Sq+3OBYXcWNunmUNAkjqaUTF3rRU62otb2xSRjAVx5O?=
 =?us-ascii?Q?xH17NlzHgOBOBRcwNcPV/PJLj/fVPfOG8e0f7Iht4p+OgROIdF9eAF4OUyK1?=
 =?us-ascii?Q?Zx1mA4Z22IjvgXwy6CDIBHTjEc+rLW90a5ZPENzxXMKhZB2bIk68GXB7yiAV?=
 =?us-ascii?Q?kP40iXLTvw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ada680-0df9-49bb-d55b-08da54342d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 09:47:10.4197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mwmj4seytL9d+rd7JWcUVVpsVmSpkZlqikBR2czQPghMc8cu/gFIuONYCKdMLC3OKTI5R+vWND+OytRzGRcWFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2188
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> > Hi Avri, all,
> >
> > > > [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opco=
de
> > 0x03
> > > > for idn 1 failed, index 0, err =3D 253
> > > > [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opco=
de
> > 0x03
> > > > for idn 1 failed, index 0, err =3D 253
> > > > [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opco=
de
> > 0x03
> > > > for idn 1 failed, index 0, err =3D 253
> > > > [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry=
:
> > query
> > > > attribute, idn 1, failed with error 253 after 3 retires
> > > Should be interesting to find out who is trying to read an undefined
> > (reserved) attribute in your system.
> >
> > So, the call trace is:
> >
> > [    0.455361] Call trace:
> > [    0.455521]  ufshcd_query_attr_retry+0x68/0xb0
> > [    0.455808]  ufshpb_get_dev_info+0x80/0x110
> > [    0.456083]  ufshcd_probe_hba+0xce0/0x10d0
> > [    0.456349]  ufshcd_async_scan+0x34/0x310
> > [    0.456609]  async_run_entry_fn+0x34/0x130
> > [    0.456873]  process_one_work+0x1e4/0x434
> > [    0.457136]  worker_thread+0x174/0x4dc
> > [    0.457379]  kthread+0xdc/0xe0
> > [    0.457580]  ret_from_fork+0x10/0x20
> >
> > which leads me to this call in ufshpb_get_dev_info():
> >
> > 2622         ret =3D ufshcd_query_attr_retry(hba,
> > UPIU_QUERY_OPCODE_READ_ATTR,
> > 2623                 QUERY_ATTR_IDN_MAX_HPB_SINGLE_CMD, 0, 0,
> > &max_single_cmd);
> >
> > And from here on, I miss the UFS experience to debug further. But I
> > will happily provide more information if people give me pointers.
> Ah ok.
> That's cool - HPB is enable on your platform.
> For some reason JEDEC didn't merge the HPB amendment into UFS4.0 - and I
> forgot all about that attribute.
And the source of this error is that your device does not support HPB2.0,
Which is fine, because HPB2.0 support was removed a while ago.

Thanks,
Avri

>=20
> Thanks,
> Avri
>=20
> >
> > All the best,
> >
> >    Wolfram
