Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E32420493
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 03:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhJDBFy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Oct 2021 21:05:54 -0400
Received: from mail-ty1jpn01hn2203.outbound.protection.outlook.com ([52.100.189.203]:61620
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230508AbhJDBFy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Oct 2021 21:05:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg3w+QUjVDUYPDkHXW9p4PwS8UGOd/vu2T5O2YzFm0w57tfa1qVPaEuQYOyjN5kqS6Yxe8VW90Ct9pCDQltUy6YGMPt/0Fvcv7MXZJy8ZG9OSh0Q0E9o3a4lZmfc7u8mY2jLxtlIj63a1+XFcZP4phKryfedqR9tVDV8hD9jisvdHCclPuD6fe6hyC+om+XwCLQgvL+zOo7m7yFUoaYjXVoqZH4pzmy5k2shE3S2ZutYxumn9tdz8wtR/UghnkDXEnw22YVKnqPujo4bfmTL70PBo1Dt5mdimjVfFaifVHmITkgrZZOucd3lv03QW3bDAU9plVK0N5Pa6wGvGptrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfmYjafpMnCdv3Hgu4i4H7lOrgJmq/2CKkvqYb3hCNU=;
 b=YgWk6JyLiwL4ydrUihmKqVyBnB/dLkaIvLhIFy0+iFB/i31EIbfBn596/hfwb2nUN660TQzbXYquH9+5A3uTaUtk8+vgodOeXcI8MlQt3ICs1X2C5EX5XkbaCE91l7I8ah8EH3DO/2VJ2+MxNztwFXFn5RX6XoFdgQoX9/Hl/2Q/K/ui64a2+HUsQB8SwJ3fgfLQMqNKG2k8durxpkkqlkrx+MIHW1XqhIBIRlvd1pvdQh7yOsiPPmY/adcq1/Va7JLMVr7aBf6oXGjZkojboNFf5OtV/1GycduP/PFZFnORKTTiK4E3pF2aY7dDN3PKDjUc5Zr3MD6z8eBDWZPldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfmYjafpMnCdv3Hgu4i4H7lOrgJmq/2CKkvqYb3hCNU=;
 b=ffuW6q7Tt11ZDMcx4+qIdCD4w20J5qlFKyi/rsDSscIg6u53+YNBefJ0oIiS7UVqDZHoW90x91oIUFP8Uos4LRXR9SCy6dvXuxAKlKSMo3R5tssCKRAmRI/KqpSew8TgCHSUXSvhUTuV/H/MHhgSf/qtcuVsgce+Eu716c9j7oM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB5743.jpnprd01.prod.outlook.com (2603:1096:400:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 01:04:02 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9839:5084:5058:cda4]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9839:5084:5058:cda4%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 01:04:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for
 termination
Thread-Topic: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for
 termination
Thread-Index: AQHXaBdcBycUS/jniEOaZVFhdDiNbKvCkZCg
Date:   Mon, 4 Oct 2021 01:04:02 +0000
Message-ID: <TY2PR01MB3692889E1A7476C4322CC296D8AE9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc83bdec-32eb-45f3-5d96-08d986d2db1b
x-ms-traffictypediagnostic: TYCPR01MB5743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB574360CE5F268B6A40BE715FD8AE9@TYCPR01MB5743.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?FQyAWug7K6Mdv1XhWMrb+GDuZqxXK6RQif43xPCSqQNXH9haXjPb/XR8JzaM?=
 =?us-ascii?Q?7Fvn0MgLuIKfQvat2sBTBXSDtEyHbsoFXsqrtlWXGNZ/Ay6r1YA7CwLcr7kv?=
 =?us-ascii?Q?g7GLSBXVRMCc9owkZqjbsbqedJ4VbBkVVBPhUDUK0PHkIVMUAFR3idOS2oZc?=
 =?us-ascii?Q?kg9B7roS4eP/E+/kBK83OQ+bRLlRD6iVb4UBGThRpWIL2BkpTGV+uJDNLafx?=
 =?us-ascii?Q?nuD/NV8tVGGHW4Ob0wWzQUf+iTTLw7+0bcSK9iWsYCgOu13/t8dyKzN8IlmR?=
 =?us-ascii?Q?+XIw9dD9Mrq2IavLIlEzcdFZuD+/7wC1xfaxMzfZRlsI+6x0nwPO7u+efbgQ?=
 =?us-ascii?Q?G6QtHHJGNZviznupbB4myfX4qigVOZ1muo2ChwLEAr5sVNOhJlJFjEbVK/N2?=
 =?us-ascii?Q?bO+k7zgOkgT2FIPXZGlPzw1wdZkb0A2LxTfX+ycH6hJBYIr5XjXs4oZAnIWS?=
 =?us-ascii?Q?Igaih/Fa9Oz/eFmTtcxUGqQUlrOv+2ms7sT9ZmvkjND4dLTzrY36/CZnfFVW?=
 =?us-ascii?Q?qZ+Vv9Mnv8bWfZiIUnXKBERByGJm964RD46iu2T7peh8SNyLnjAd5mkWRirP?=
 =?us-ascii?Q?nw80ZOl2iWlMQfxB1DZrRE5miptsbrM9YR2g7eLTvicXUjgmVzY0hWzH+Enh?=
 =?us-ascii?Q?lFbhy24MgedlPNOfb0/r28JHa5SRCTu1kk2XKt5JC0tB2BbhuWwr5G+WRoT/?=
 =?us-ascii?Q?DHBBOGs1ahur+r7gSaPWrXh7lf4rtRjb0jPh2ZR96cQhDX+nyTufVl9cW38e?=
 =?us-ascii?Q?H690o8KWY4MpXJreLNrGUCSiE9btz58j1Na0DqOrb9XxWdPtEv8DL7RGBynB?=
 =?us-ascii?Q?4p9eK5zrpKkEOs9XcDy/nCS/bKVib6qTJYHWapui1Q2XCMRNDujBHVikxSJn?=
 =?us-ascii?Q?9MyA0wyKZjW+CUfWptkvzWxU/sAyorKiWDikIptTpkBk5njxswN+SMViNVDJ?=
 =?us-ascii?Q?k0ujuapQgJ+H0VrBFIhzmfbDZtzKphuMgSqOU2eOMiawdzeFwcCdkxVyq4fM?=
 =?us-ascii?Q?CUgkpfrn3ulJ7yDyzi8TfZCTwtH+/6tjtssPUDujawK1tC8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:OSPM;SFS:(4636009)(366004)(76116006)(66946007)(66476007)(66556008)(64756008)(107886003)(7696005)(9686003)(66446008)(6506007)(186003)(71200400001)(83380400001)(8676002)(2906002)(8936002)(38070700005)(55016002)(26005)(33656002)(316002)(508600001)(4326008)(5660300002)(122000001)(52536014)(38100700002)(54906003)(86362001)(581274003);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZXZk8YimukwOQxZe/zbMjfpgt7Tp8tVjRC87CIkAKK56DjEC075+ijij2LQM?=
 =?us-ascii?Q?rMLT6PlCWapF5p9qfJro4eJ/4L6vCWztVtgNhZmaNWtyTkbdsGEKa9LOSCZu?=
 =?us-ascii?Q?+QZlwYo1xGN93eg4cWgGQPas0bCiJeSRsrW+4vW4afrh9MWw9LhlgR478fDP?=
 =?us-ascii?Q?kNJGADmB+3urgIiqyDyqhuddwn7r7UEhd4xNwz0Z8XBuJHcyZ6raTJycVp63?=
 =?us-ascii?Q?QOiVUAc5PwlG8MYo41LEiSgBlYKPmt2ODI3VzaY17/mxQXN6khv8ddfdNya7?=
 =?us-ascii?Q?RSROdqfbbV2YaPJYnT4O0D/UT3sd/qbtI8e9Tq6hlEAU+PjjbEAJKf0Hi36J?=
 =?us-ascii?Q?bs+kKOyqg+N5n+s8pcuW567EzGNgb89l4NG+wToGRGY0TKQTBVxVNnWyihDp?=
 =?us-ascii?Q?4tusUT/eZDRT44cF8VVvpb9UFus+qXKV3X1a6Or84wXekak8uwCQ9pZKeA8k?=
 =?us-ascii?Q?7y2Fql7XdUcjVD2tEPQBMHlLZaHoOc0Qcwy/dn2+DQ34DOwONO4/DJaBgUBL?=
 =?us-ascii?Q?aYxMSnwWqeh8eLeAIgt7IIYhddNwf9Qiyb/bRVCK6NG+9gzvGhvnR/X+JolQ?=
 =?us-ascii?Q?3wqcSVY/hpheCZgiewcT9glkCDrSNqqQZd2F84G+6ngIf5L7kNegi08K3TZp?=
 =?us-ascii?Q?G/rxpTG/ebJdzqhbNHKcGeMWj+C7Rs2HOQJtigDq+UEMrU9pUasA1yth31zg?=
 =?us-ascii?Q?ENod3UCTrFfWS6ccG/K9HJ9vY8wZDn9LAiE/87bNiy0aaOneGKNLC0wb7RI1?=
 =?us-ascii?Q?fojr9LWo4Gfzjh91L5RQWSu1/oj+1er8LZ/jV+GWjXfR3SS92YDkwWuKLflk?=
 =?us-ascii?Q?+6SbkIrGwa7Wg4RD7XncRPkkYJNnCEfLVWrO8/JpYLnCfGzE9++oZ/hAn8hl?=
 =?us-ascii?Q?9rSaSN/Dx9aoOgqI1NCHRTfvTY9xgRX7ES1/t+waCk9awDcCaUHAGPhqISOi?=
 =?us-ascii?Q?t86MjWq7YIzxw/Nv+jhAjqYI+mEg7MNCj3zhWqKgehgReEFJxFdSOMLNGMfv?=
 =?us-ascii?Q?5vy8xyX1dj3aOJDI4NSN/VvTJO6qvnTvVgftfbPHOyF4usXjG4Pn4qIlDR6L?=
 =?us-ascii?Q?mBvVz3TbnnCxYZRmHqDcKpzNb1It184+paXGtDrr1Y3J0w8k0KM9ni88Z2zS?=
 =?us-ascii?Q?5qT3znzStK7w5FTUdaduYiWlG7zp9teBIvGFskiLLC4XtMK8sZauk87eJ87u?=
 =?us-ascii?Q?Jp9IJxN05D6m6bHv/RKgZSKXLyJfGoQ2zx5VOuaYL7KKg3mcqQGmmAs8CBgV?=
 =?us-ascii?Q?6j9XWOkPB+cQePte1zSMZArOr5Mu1NH6bfzF4ivc2+b0yWNQU6wb4PIsHfAd?=
 =?us-ascii?Q?LNhPjUmPSZIm8hzExBttqDAx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc83bdec-32eb-45f3-5d96-08d986d2db1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 01:04:02.5604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dr5wOxPDEwk80l+3YVldw2dk/PL6mQKMh4G/dH10I14FW+HD1S0g2CIY/6NwbHKz/E3kk9lEAL1REuT/VwkK8/0JmQkMwWw2qlgeDZ9mRAVRoQ6DSrbwJfJuD9nnE+E/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5743
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 23, 2021 7:06 PM
>=20
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Morimoto-san, can you please double check if this works. I don't know
> this driver very well. Thank you!
>=20
>  sound/soc/sh/rcar/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
> index 95aa26d62e4f..d1b46057df9e 100644
> --- a/sound/soc/sh/rcar/dma.c
> +++ b/sound/soc/sh/rcar/dma.c
> @@ -101,7 +101,7 @@ static int rsnd_dmaen_stop(struct rsnd_mod *mod,
>  	struct rsnd_dmaen *dmaen =3D rsnd_dma_to_dmaen(dma);
>=20
>  	if (dmaen->chan)
> -		dmaengine_terminate_all(dmaen->chan);
> +		dmaengine_terminate_sync(dmaen->chan);
>=20
>  	return 0;
>  }

I'm afraid but, our test team detected an issue [1] on v5.15-rc2 with m3ulc=
b and ebusu.
# Our test team doesn't test this on salvator-xs yet...
I asked Morimoto-san locally, and he guess that using dmaengine_terminate_a=
sync() instead
of dmaengine_terminate_sync() could be resolved. But, what do you think?

Best regards,
Yoshihiro Shimoda

----
[1]
root@m3ulcb:~# amixer set 'DVC Out Mute' off
Simple mixer control 'DVC Out Mute',0
  Capabilities: pswitch
  Playback channels: Front Left - Front Right
  Mono:
  Front Left: Playback [off]
  F on v5.15-rc2ront Right: Playback [off]
root@m3ulcb:~#=20
root@m3ulcb:~# amixer set 'DVC In Mute' off
Simple mixer control 'DVC In Mute',0
  Capabilities: pswitch
  Playback channels: Front Left - Front Right
  Mono:
  Front Left: Playback [off]
  Front Right: Playback [off]
root@m3ulcb:~#=20
root@m3ulcb:~# amixer set "DVC Out" 20%
Simple mixer control 'DVC Out',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 8388607
  Mono:
  Front Left: Playback 1677722 [20%]
  Front Right: Playback 1677722 [20%]
root@m3ulcb:~#=20
root@m3ulcb:~# amixer set "DVC In" 50%
Simple mixer control 'DVC In',0
  Capabilities: cvolume
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 8388607
  Front Left: Capture 4194304 [50%]
  Front Right: Capture 4194304 [50%]
root@m3ulcb:~#=20
root@m3ulcb:~# amixer set "Digital Playback Volume1" 85%
Simple mixer control 'Digital Playback Volume1',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 255
  Front Left: 217 [85%]
  Front Right: 217 [85%]
root@m3ulcb:~#=20
root@m3ulcb:~# aplay  ~/audio.wav
Playing WAVE '/home/root/audio.wav' : Signed 32 bit Little Endian, Rate 441=
00 Hz, Stereo
[  161.583393] BUG: scheduling while atomic: irq/128-ec70000/238/0x00000003
[  161.590358] 2 locks held by irq/128-ec70000/238:
[  161.595053]  #0: ffff000442670508 (&group->lock){....}-{2:2}, at: _snd_p=
cm_stream_lock_irqsave+0x34/0x40
[  161.604723]  #1: ffff000442e3aea0 (&priv->lock#3){....}-{2:2}, at: rsnd_=
soc_dai_trigger+0x64/0x7c8
[  161.613853] irq event stamp: 48292
[  161.617310] hardirqs last  enabled at (48291): [<ffff800010ca1d5c>] _raw=
_spin_unlock_irq+0x3c/0x88
[  161.626418] hardirqs last disabled at (48292): [<ffff800010ca1968>] _raw=
_spin_lock_irqsave+0xb0/0xc0
[  161.635699] softirqs last  enabled at (47268): [<ffff800010010464>] _ste=
xt+0x464/0x5d8
[  161.643746] softirqs last disabled at (47263): [<ffff80001008f738>] irq_=
exit+0x198/0x1b8
[  161.651975] CPU: 0 PID: 238 Comm: irq/128-ec70000 Not tainted 5.15.0-rc2=
-arm64-renesas #1
[  161.660287] Hardware name: Renesas M3ULCB Kingfisher board based on r8a7=
7961 (DT)
[  161.667888] Call trace:
[  161.670376]  dump_backtrace+0x0/0x188
[  161.674103]  show_stack+0x14/0x20
[  161.677474]  dump_stack_lvl+0x88/0xb0
[  161.681201]  dump_stack+0x14/0x2c
[  161.684571]  __schedule_bug+0x7c/0x90
[  161.688298]  __schedule+0x8bc/0x960
[  161.691848]  schedule+0x6c/0xf8
[  161.695043]  synchronize_irq+0x74/0xa8
[  161.698858]  rcar_dmac_device_synchronize+0x10/0x18
[  161.703820]  rsnd_dmaen_stop+0x40/0x50
[  161.707633]  rsnd_soc_dai_trigger+0x640/0x7c8
[  161.712061]  soc_dai_trigger+0x3c/0x80
[  161.715875]  snd_soc_pcm_dai_trigger+0xc0/0x168
[  161.720481]  soc_pcm_trigger+0x144/0x1b8
[  161.724472]  snd_pcm_do_stop+0x64/0x80
[  161.728284]  snd_pcm_action_single+0x44/0x98
[  161.732625]  snd_pcm_drain_done+0x20/0x28
[  161.736701]  snd_pcm_update_state+0xf4/0x128
[  161.741043]  snd_pcm_update_hw_ptr0+0x22c/0x3b0
[  161.745649]  snd_pcm_period_elapsed_under_stream_lock+0x64/0x88
[  161.751665]  snd_pcm_period_elapsed+0x24/0x40
[  161.756092]  rsnd_dai_period_elapsed+0x10/0x18
[  161.760611]  __rsnd_dmaen_complete+0x30/0x40
[  161.764953]  rsnd_mod_interrupt+0x90/0xe0
[  161.769029]  rsnd_dmaen_complete+0x14/0x20
[  161.773194]  rcar_dmac_isr_channel_thread+0x188/0x198
[  161.778328]  irq_thread_fn+0x28/0x88
[  161.781963]  irq_thread+0x158/0x1c8
[  161.785510]  kthread+0x14c/0x158
[  161.788794]  ret_from_fork+0x10/0x20
[  199.053832] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  199.060273] rcu: 	2-...0: (0 ticks this GP) idle=3D891/1/0x4000000000000=
000 softirq=3D3570/3570 fqs=3D3093=20
[  199.070267] 	(detected by 0, t=3D6505 jiffies, g=3D8077, q=3D6)
[  199.075940] Task dump for CPU 2:
[  199.079339] task:aplay           state:R  running task     stack:    0 p=
id:  513 ppid:   502 flags:0x00000202
[  199.089753] Call trace:
[  199.092333]  __switch_to+0x12c/0x180
[  199.096113]  0x3ec50aaa435c9700
[  199.099421]  snd_pcm_stream_lock_irq+0x30/0x38

