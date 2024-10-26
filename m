Return-Path: <linux-renesas-soc+bounces-10168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71B9B1417
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 03:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB7E1F22647
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 01:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF7E2AE69;
	Sat, 26 Oct 2024 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW1qsBvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763915661;
	Sat, 26 Oct 2024 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729907552; cv=none; b=Tl5a61Nv0VNUj9EcYSsFlUWMJHeJmdiiz8BsbtOToWxmMWOstUU1xmg80Caxw+dqnJttQMDoyDf7ps9jLUif46scIssKod9K8Q+LvipQ5ThveYOj2qnalmm7D6C4siBSPgn4JEyVo83IWPS3iGE6MLMB4OEbSwu/q9Tsby6ExWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729907552; c=relaxed/simple;
	bh=BRLoB4ccTxc30spY7o9xX354eoGpld1pft/++XkXXSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsJJm7EUI/5Kn6L3VHattqCbPj/Vma/NfQz4DczQP2WP/zZoZwxwrVsaspVWt5mUm6nazgKFUCWLCBUJ/rnBJBAW8BAsygwXoMHDGBbkJ8EDIXUg4urQarMzwMXM8jlugaYXqkd+gWmSrDVWtzOwqclJPAZR8y4MsE+VpO4BkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW1qsBvm; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e34339d41bso25833847b3.0;
        Fri, 25 Oct 2024 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729907548; x=1730512348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooATJTLtFzZb8pHEQaf62by8viD3blquhXGIqDYDJoU=;
        b=WW1qsBvmAJPqLqH6PQ5feC1Kn+jYTw5blKqoErh/MBdo0Am7kIoeSiiDDklk0HXsZA
         SfT5Ktwo7TzQB2LAVNl4yDj2fIvJ1Gqr5zIlFd8xIMkG5oqVk6p+2Qtakz9YQpoPqfKX
         Kjgz5cjRW49PkgPGMS0Qy+sQxBCw9Au9oiRyq9q30EBvbIkDut6SBnF3aoQpy1jrJtfn
         8sMCiQgXszDeyMNyCOzKI+PEoqTSZlchJIRkWSz6xje/z6Y8C80EmCxT8PKMQ9MRf+Fc
         +GEqj2pp8ib52UeJ9tRLNek4dRyVg2/AhVaTO4gMbylPpyqS2UgvhePdl4GVu1W3qnCE
         SPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729907548; x=1730512348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooATJTLtFzZb8pHEQaf62by8viD3blquhXGIqDYDJoU=;
        b=ZmLk8vewPiXYuZJQ5qLaHh/yrdOHH6Yc+cA3rzehQsOxL7g+YZjxb/YRtj9KwTzUY0
         RGK5CDe3KWI3lhwZ6U4XY6PNleJo/LXW0kGdX21xuVKBQNaMb101u/+Gb50CGUzP8rf2
         L9b/a2IRQy61r0Zxgp/C/HELAU6F993buFIWyiOlTntv69EMEPS+V2D3P4nD7A5Ly+6x
         XoER6XUjd6K/TavoQghyI+66Yeic9rB4cy+sp33adn5zWYLeUjWW9T3M4QLrO7JmmeHG
         qg12QISerLX61CgjocJS3R/JFu8VZ/mv9mFng4cZc1rCSF1NrI0dBSnM0KG692ijAlPe
         FJfw==
X-Forwarded-Encrypted: i=1; AJvYcCU/6SaXsXWVKZaANPmJwtVBJKTm6HOeNx5wR/T4bsVRyUZZRc32++9Fahy0yRZYaoKTY0t0rAwyuDkAU/g=@vger.kernel.org, AJvYcCW4E8dsQNAcghAoXQSdyptH3pL+EmS6VQ2y0mcJTz2np+ep4Dxgmgs0XDd+8T22gyWLKHN3NOnYpf12PEx7sJKGhRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrKXfacYwUL/g97lTFHBKQtN+Lie4SmrVZvZmTq4Fnw2iW1YQ
	ROes6JNi8gAVCr0nGwdIXJHmf6KVdB1+i6Zqm0tVYl17XgHj2qrvGN4VuC74EhALsThVfYsRp15
	+r+Fw4Y1HTjQ510u2aXrmDRNpNJpFmtZv
X-Google-Smtp-Source: AGHT+IGSe9j4Qu68RZ9usd4K6Q6K6o8yVcTMnFdp5GrmhtYjSCL2k2kQRJq7l6th9QvRQ2hSdTQHcLqFk+CD4lfRAZo=
X-Received: by 2002:a05:690c:f15:b0:6e2:aceb:fb34 with SMTP id
 00721157ae682-6e9d88ea2b9mr16432367b3.1.1729907548095; Fri, 25 Oct 2024
 18:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025200807.189223-1-rosenp@gmail.com>
In-Reply-To: <20241025200807.189223-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 25 Oct 2024 18:52:17 -0700
Message-ID: <CAKxU2N98gcuaqosXWh3m2Eoyo1V03WE66scnTzn3sb8L8z=Kwg@mail.gmail.com>
Subject: Re: [PATCHv4 net-next] net: dsa: use ethtool string helpers
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	George McCollister <george.mccollister@gmail.com>, Simon Horman <horms@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 1:08=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> These are the preferred way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (for hellcreek driver)
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  v4: add back pointer math for b53_get_strings. Needed as prototype
>  can't be change to double pointer.
>  v3: remove curly braces from ksz_common.c
>  v2: remove curly braces from rzn1_a5psw.c
>  drivers/net/dsa/b53/b53_common.c          |  3 +--
>  drivers/net/dsa/bcm_sf2.c                 |  4 ++--
>  drivers/net/dsa/bcm_sf2.h                 |  2 +-
>  drivers/net/dsa/bcm_sf2_cfp.c             | 20 ++++++--------------
>  drivers/net/dsa/dsa_loop.c                |  3 +--
>  drivers/net/dsa/hirschmann/hellcreek.c    |  8 ++------
>  drivers/net/dsa/microchip/ksz_common.c    |  6 ++----
>  drivers/net/dsa/mv88e6xxx/chip.c          | 17 ++---------------
>  drivers/net/dsa/mv88e6xxx/serdes.c        |  6 ++----
>  drivers/net/dsa/rzn1_a5psw.c              |  6 ++----
>  drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 ++-----
>  drivers/net/dsa/xrs700x/xrs700x.c         |  6 ++----
>  net/dsa/user.c                            | 13 +++++--------
>  13 files changed, 30 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index c39cb119e760..285785c942b0 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -989,8 +989,7 @@ void b53_get_strings(struct dsa_switch *ds, int port,=
 u32 stringset,
>
>         if (stringset =3D=3D ETH_SS_STATS) {
>                 for (i =3D 0; i < mib_size; i++)
> -                       strscpy(data + i * ETH_GSTRING_LEN,
> -                               mibs[i].name, ETH_GSTRING_LEN);
> +                       ethtool_puts(&data, mibs[i].name);
>         } else if (stringset =3D=3D ETH_SS_PHY_STATS) {
>                 phydev =3D b53_get_phy_device(ds, port);
>                 if (!phydev)
> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 9201f07839ad..43bde1f583ff 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1183,8 +1183,8 @@ static void bcm_sf2_sw_get_strings(struct dsa_switc=
h *ds, int port,
>         int cnt =3D b53_get_sset_count(ds, port, stringset);
>
>         b53_get_strings(ds, port, stringset, data);
> -       bcm_sf2_cfp_get_strings(ds, port, stringset,
> -                               data + cnt * ETH_GSTRING_LEN);
> +       data +=3D cnt * ETH_GSTRING_LEN;
> +       bcm_sf2_cfp_get_strings(ds, port, stringset, &data);
>  }
>
>  static void bcm_sf2_sw_get_ethtool_stats(struct dsa_switch *ds, int port=
,
> diff --git a/drivers/net/dsa/bcm_sf2.h b/drivers/net/dsa/bcm_sf2.h
> index 4fda075a3449..e61e3bf688ff 100644
> --- a/drivers/net/dsa/bcm_sf2.h
> +++ b/drivers/net/dsa/bcm_sf2.h
> @@ -229,7 +229,7 @@ int bcm_sf2_cfp_rst(struct bcm_sf2_priv *priv);
>  void bcm_sf2_cfp_exit(struct dsa_switch *ds);
>  int bcm_sf2_cfp_resume(struct dsa_switch *ds);
>  void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
> -                            u32 stringset, uint8_t *data);
> +                            u32 stringset, uint8_t **data);
>  void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
>                                    uint64_t *data);
>  int bcm_sf2_cfp_get_sset_count(struct dsa_switch *ds, int port, int sset=
);
> diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.=
c
> index c88ee3dd4299..95991334561e 100644
> --- a/drivers/net/dsa/bcm_sf2_cfp.c
> +++ b/drivers/net/dsa/bcm_sf2_cfp.c
> @@ -1280,26 +1280,18 @@ static const struct bcm_sf2_cfp_stat {
>  };
>
>  void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
> -                            u32 stringset, uint8_t *data)
> +                            u32 stringset, uint8_t **data)
>  {
>         struct bcm_sf2_priv *priv =3D bcm_sf2_to_priv(ds);
> -       unsigned int s =3D ARRAY_SIZE(bcm_sf2_cfp_stats);
> -       char buf[ETH_GSTRING_LEN];
> -       unsigned int i, j, iter;
> +       unsigned int i, j;
>
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
>
> -       for (i =3D 1; i < priv->num_cfp_rules; i++) {
> -               for (j =3D 0; j < s; j++) {
> -                       snprintf(buf, sizeof(buf),
> -                                "CFP%03d_%sCntr",
> -                                i, bcm_sf2_cfp_stats[j].name);
> -                       iter =3D (i - 1) * s + j;
> -                       strscpy(data + iter * ETH_GSTRING_LEN,
> -                               buf, ETH_GSTRING_LEN);
> -               }
> -       }
> +       for (i =3D 1; i < priv->num_cfp_rules; i++)
> +               for (j =3D 0; j < ARRAY_SIZE(bcm_sf2_cfp_stats); j++)
> +                       ethtool_sprintf(data, "CFP%03d_%sCntr", i,
> +                                       bcm_sf2_cfp_stats[j].name);
>  }
>
>  void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
> index c70ed67cc188..adbab544c60f 100644
> --- a/drivers/net/dsa/dsa_loop.c
> +++ b/drivers/net/dsa/dsa_loop.c
> @@ -121,8 +121,7 @@ static void dsa_loop_get_strings(struct dsa_switch *d=
s, int port,
>                 return;
>
>         for (i =3D 0; i < __DSA_LOOP_CNT_MAX; i++)
> -               memcpy(data + i * ETH_GSTRING_LEN,
> -                      ps->ports[port].mib[i].name, ETH_GSTRING_LEN);
> +               ethtool_puts(&data, ps->ports[port].mib[i].name);
>  }
>
>  static void dsa_loop_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hir=
schmann/hellcreek.c
> index d798f17cf7ea..283ec5a6e23c 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> @@ -294,12 +294,8 @@ static void hellcreek_get_strings(struct dsa_switch =
*ds, int port,
>  {
>         int i;
>
> -       for (i =3D 0; i < ARRAY_SIZE(hellcreek_counter); ++i) {
> -               const struct hellcreek_counter *counter =3D &hellcreek_co=
unter[i];
> -
> -               strscpy(data + i * ETH_GSTRING_LEN,
> -                       counter->name, ETH_GSTRING_LEN);
> -       }
> +       for (i =3D 0; i < ARRAY_SIZE(hellcreek_counter); ++i)
> +               ethtool_puts(&data, hellcreek_counter[i].name);
>  }
>
>  static int hellcreek_get_sset_count(struct dsa_switch *ds, int port, int=
 sset)
> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/mic=
rochip/ksz_common.c
> index 5290f5ad98f3..f73833e24622 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -2112,10 +2112,8 @@ static void ksz_get_strings(struct dsa_switch *ds,=
 int port,
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
>
> -       for (i =3D 0; i < dev->info->mib_cnt; i++) {
> -               memcpy(buf + i * ETH_GSTRING_LEN,
> -                      dev->info->mib_names[i].string, ETH_GSTRING_LEN);
> -       }
> +       for (i =3D 0; i < dev->info->mib_cnt; i++)
> +               ethtool_puts(&buf, dev->info->mib_names[i].string);
>  }
>
>  /**
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx=
/chip.c
> index 4f5193d86e65..1893fed00467 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -1162,8 +1162,7 @@ static int mv88e6xxx_stats_get_strings(struct mv88e=
6xxx_chip *chip,
>         for (i =3D 0, j =3D 0; i < ARRAY_SIZE(mv88e6xxx_hw_stats); i++) {
>                 stat =3D &mv88e6xxx_hw_stats[i];
>                 if (stat->type & types) {
> -                       memcpy(data + j * ETH_GSTRING_LEN, stat->string,
> -                              ETH_GSTRING_LEN);
> +                       ethtool_puts(&data, stat->string);
>                         j++;
>                 }
>         }
> @@ -1204,31 +1203,19 @@ static void mv88e6xxx_atu_vtu_get_strings(uint8_t=
 *data)
>         unsigned int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(mv88e6xxx_atu_vtu_stats_strings); i+=
+)
> -               strscpy(data + i * ETH_GSTRING_LEN,
> -                       mv88e6xxx_atu_vtu_stats_strings[i],
> -                       ETH_GSTRING_LEN);
> +               ethtool_puts(&data, mv88e6xxx_atu_vtu_stats_strings[i]);
>  }
>
>  static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
>                                   u32 stringset, uint8_t *data)
>  {
>         struct mv88e6xxx_chip *chip =3D ds->priv;
> -       int count =3D 0;
>
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
>
>         mv88e6xxx_reg_lock(chip);
>
> -       if (chip->info->ops->stats_get_strings)
> -               count =3D chip->info->ops->stats_get_strings(chip, data);
> -
> -       if (chip->info->ops->serdes_get_strings) {
> -               data +=3D count * ETH_GSTRING_LEN;
> -               count =3D chip->info->ops->serdes_get_strings(chip, port,=
 data);
> -       }

Removal of these function calls looks wrong. To get rid of pointer
arithmetic here, I think they need to be changed to u8**.

> -
> -       data +=3D count * ETH_GSTRING_LEN;
>         mv88e6xxx_atu_vtu_get_strings(data);
>
>         mv88e6xxx_reg_unlock(chip);
> diff --git a/drivers/net/dsa/mv88e6xxx/serdes.c b/drivers/net/dsa/mv88e6x=
xx/serdes.c
> index 01ea53940786..327831d2b547 100644
> --- a/drivers/net/dsa/mv88e6xxx/serdes.c
> +++ b/drivers/net/dsa/mv88e6xxx/serdes.c
> @@ -144,8 +144,7 @@ int mv88e6352_serdes_get_strings(struct mv88e6xxx_chi=
p *chip,
>
>         for (i =3D 0; i < ARRAY_SIZE(mv88e6352_serdes_hw_stats); i++) {
>                 stat =3D &mv88e6352_serdes_hw_stats[i];
> -               memcpy(data + i * ETH_GSTRING_LEN, stat->string,
> -                      ETH_GSTRING_LEN);
> +               ethtool_puts(&data, stat->string);
>         }
>         return ARRAY_SIZE(mv88e6352_serdes_hw_stats);
>  }
> @@ -405,8 +404,7 @@ int mv88e6390_serdes_get_strings(struct mv88e6xxx_chi=
p *chip,
>
>         for (i =3D 0; i < ARRAY_SIZE(mv88e6390_serdes_hw_stats); i++) {
>                 stat =3D &mv88e6390_serdes_hw_stats[i];
> -               memcpy(data + i * ETH_GSTRING_LEN, stat->string,
> -                      ETH_GSTRING_LEN);
> +               ethtool_puts(&data, stat->string);
>         }
>         return ARRAY_SIZE(mv88e6390_serdes_hw_stats);
>  }
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 1135a32e4b7e..66974379334a 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -802,10 +802,8 @@ static void a5psw_get_strings(struct dsa_switch *ds,=
 int port, u32 stringset,
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
>
> -       for (u =3D 0; u < ARRAY_SIZE(a5psw_stats); u++) {
> -               memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
> -                      ETH_GSTRING_LEN);
> -       }
> +       for (u =3D 0; u < ARRAY_SIZE(a5psw_stats); u++)
> +               ethtool_puts(&data, a5psw_stats[u].name);
>  }
>
>  static void a5psw_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/sja1105/sja1105_ethtool.c b/drivers/net/dsa/=
sja1105/sja1105_ethtool.c
> index decc6c931dc1..2ea64b1d026d 100644
> --- a/drivers/net/dsa/sja1105/sja1105_ethtool.c
> +++ b/drivers/net/dsa/sja1105/sja1105_ethtool.c
> @@ -586,7 +586,6 @@ void sja1105_get_strings(struct dsa_switch *ds, int p=
ort,
>  {
>         struct sja1105_private *priv =3D ds->priv;
>         enum sja1105_counter_index max_ctr, i;
> -       char *p =3D data;
>
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
> @@ -597,10 +596,8 @@ void sja1105_get_strings(struct dsa_switch *ds, int =
port,
>         else
>                 max_ctr =3D __MAX_SJA1105PQRS_PORT_COUNTER;
>
> -       for (i =3D 0; i < max_ctr; i++) {
> -               strscpy(p, sja1105_port_counters[i].name, ETH_GSTRING_LEN=
);
> -               p +=3D ETH_GSTRING_LEN;
> -       }
> +       for (i =3D 0; i < max_ctr; i++)
> +               ethtool_puts(&data, sja1105_port_counters[i].name);
>  }
>
>  int sja1105_get_sset_count(struct dsa_switch *ds, int port, int sset)
> diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/=
xrs700x.c
> index de3b768f2ff9..4dbcc49a9e52 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x.c
> @@ -91,10 +91,8 @@ static void xrs700x_get_strings(struct dsa_switch *ds,=
 int port,
>         if (stringset !=3D ETH_SS_STATS)
>                 return;
>
> -       for (i =3D 0; i < ARRAY_SIZE(xrs700x_mibs); i++) {
> -               strscpy(data, xrs700x_mibs[i].name, ETH_GSTRING_LEN);
> -               data +=3D ETH_GSTRING_LEN;
> -       }
> +       for (i =3D 0; i < ARRAY_SIZE(xrs700x_mibs); i++)
> +               ethtool_puts(&data, xrs700x_mibs[i].name);
>  }
>
>  static int xrs700x_get_sset_count(struct dsa_switch *ds, int port, int s=
set)
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index 91a1fa5f8ab0..f7b0630dd2b6 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -1042,15 +1042,12 @@ static void dsa_user_get_strings(struct net_devic=
e *dev,
>         struct dsa_switch *ds =3D dp->ds;
>
>         if (stringset =3D=3D ETH_SS_STATS) {
> -               int len =3D ETH_GSTRING_LEN;
> -
> -               strscpy_pad(data, "tx_packets", len);
> -               strscpy_pad(data + len, "tx_bytes", len);
> -               strscpy_pad(data + 2 * len, "rx_packets", len);
> -               strscpy_pad(data + 3 * len, "rx_bytes", len);
> +               ethtool_puts(&data, "tx_packets");
> +               ethtool_puts(&data, "tx_bytes");
> +               ethtool_puts(&data, "rx_packets");
> +               ethtool_puts(&data, "rx_bytes");
>                 if (ds->ops->get_strings)
> -                       ds->ops->get_strings(ds, dp->index, stringset,
> -                                            data + 4 * len);
> +                       ds->ops->get_strings(ds, dp->index, stringset, da=
ta);
>         } else if (stringset =3D=3D  ETH_SS_TEST) {
>                 net_selftest_get_strings(data);
>         }
> --
> 2.47.0
>

