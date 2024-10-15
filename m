Return-Path: <linux-renesas-soc+bounces-9785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DE99F7D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4142A286991
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890791F76D7;
	Tue, 15 Oct 2024 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrTGu8Ji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46B1F76A9;
	Tue, 15 Oct 2024 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022690; cv=none; b=K2gwppCn/FDbs7U0dAaP/9k/oJ2s98HYodxex0Ve0p0ogWpn8Gyg10mKcDvjOyjcKvfuWfkZyNxyUGRfPoQHBm1BjAar1NYZ62av4qdMJzjXWCwmEvLqxjrzb4KUPvXQ5pT3hPihcZFfqFqB1pWmoi9wwzHt9FxqeYvIwL0farU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022690; c=relaxed/simple;
	bh=MzDDnw25EDTQx3AFNuhZFXPFSMS54Q3Zx8Tu3neGPv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA1AGtk2+774+33nr0IPDLl+/+Fb/fL4vAMLCFATD1vK0ESnOEodrPfF4HD7fpbtsNLygTYaN9MlWGtkEa+mCycxZdXE0fu3SL70lZwIBwEIkAeiSgokke9pDMhwSMhHWNOml1hiVMQixmz5djyfd5bubae8/NeDIXtI77z2pnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrTGu8Ji; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2972abc807so925313276.3;
        Tue, 15 Oct 2024 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022687; x=1729627487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+jswms/JX9IryBXE5mHGJ2fxOxddBxeIscXd5vvMlc=;
        b=GrTGu8JiYjrvd/TRCCJ7wQNIqoy31zSNjd90am4Ob58uprnCsLEFrk+wi8MmFDBMgB
         ot6LmnCxTf8yPaZX+I1zrV+zVMVvKB+hBRoDPtAEhZWv6SSHxd00AaG+Ff7Odr//x/aY
         7ZUN47I8OIef5B3PvEg5aRLoxgcWxgc8u4nGLKxql7uJCdarXSZMCalSoxcDftT7v0lT
         MsRrpXTo+BhcYMrZMB2pAuLU2C1SLRX3KmxBKyDYQEujoxrKU/TdaXC3khaony3H0HSQ
         Gk3gtF877YCWd6j4f36gZiDNhUcqhZtHTHoX+N4PitkhcOlOKADl5X+CPkN1uiFeipCs
         kKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022687; x=1729627487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+jswms/JX9IryBXE5mHGJ2fxOxddBxeIscXd5vvMlc=;
        b=oOx4G0MulCU1iDkTraD0+2DTubKyLANnHRwKcon4C5BDCDlja11EWjE68kJOAXqA4o
         /NHe2Z8WySHYil+m09WgNL8n7g4k3DsF4IRNBn/nV+XwIydPtApj6ziaTFsRzoRQfTht
         Q7nzVFMPU2mNM+8pQrNmHnvfPuoCJ/J6/QMIq8W1zyhAIli5VsjZW+IRTktqmY7YrXxD
         3xot2GQ11KmwgIXFtyZ1OJZ2vIkWNGMQcVjoJ4MLD7C9qWjpOo5//2uQgaWxNwF1SqZ0
         FlBBZM0royOb5Wp7NqAXMq1PhBPNuw5bC/2cwrYABlYt2dmP+woiblXWi32w4L3vKP76
         AGrw==
X-Forwarded-Encrypted: i=1; AJvYcCX1st3IGYM/TZBAk1IQw0zrIaLyNGw2qxJIiAPtSYs6Kr9FsW+WLqEz/mjtwkT7hUqV4Z1kE56RfpWBcUzzhQhfcu8=@vger.kernel.org, AJvYcCXIdJJ4vyuVsWATbdjX2Nv5H7ulhx+bp4dFkl4AO4K6UVhgFzy8zxn6MiwF+t6ySzrZx1sIcNDA7QfR+/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YweFaeN5QCmY/57+8rcUwotVWYlg6JGliTDrb8kfqZ/8hRtBKwW
	WhjOW3Rg9nH4q3kDWnYhUJmTd/+ZB3Uhj8++M4lti56mASjVAo4fcSXvKY3xYdDgthjBCDBYItk
	RLH3xXHwKBF/7BC7aR+LIvnKz7/H1GRJS
X-Google-Smtp-Source: AGHT+IFtSB1oRpVWOnLdajlv4MU30AR81M+ceNPwKEdoNjFt4gIf6FVdxZyISMwX8/rvxylqouhKHVhZaaDYJ2X/GFc=
X-Received: by 2002:a05:690c:f16:b0:6e3:8562:fc0 with SMTP id
 00721157ae682-6e3d3bdfcfcmr21503177b3.0.1729022687356; Tue, 15 Oct 2024
 13:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015200222.12452-1-rosenp@gmail.com> <20241015200222.12452-3-rosenp@gmail.com>
In-Reply-To: <20241015200222.12452-3-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 15 Oct 2024 13:04:36 -0700
Message-ID: <CAKxU2N-9X=_0VNvrw3=p0EzE+JroppkenGa+ciNt+GOSvAsYBQ@mail.gmail.com>
Subject: Re: [PATCH] net: memcpy to ethtool_puts
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	George McCollister <george.mccollister@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Breno Leitao <leitao@debian.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 1:02=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The latter is the prefered way to copy ethtool strings.
>
> Transformed with the following coccinelle script:
>
> virtual org
> virtual report
> virtual context
> virtual patch
>
> @depends on patch@
> expression E1, E2;
> identifier I;
> position p;
> @@
>
> - memcpy@p(E1 + I * ETH_GSTRING_LEN, E2, ETH_GSTRING_LEN);
> + ethtool_puts(&E1, E2);
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
ugh accidentally sent this. It needs more work.
> ---
>  drivers/net/dsa/b53/b53_common.c              |  3 +-
>  drivers/net/dsa/bcm_sf2.c                     |  5 +-
>  drivers/net/dsa/bcm_sf2_cfp.c                 | 17 ++--
>  drivers/net/dsa/hirschmann/hellcreek.c        |  8 +-
>  drivers/net/dsa/microchip/ksz_common.c        |  3 +-
>  drivers/net/dsa/mv88e6xxx/chip.c              |  5 +-
>  drivers/net/dsa/rzn1_a5psw.c                  |  3 +-
>  drivers/net/dsa/sja1105/sja1105_ethtool.c     |  7 +-
>  drivers/net/dsa/xrs700x/xrs700x.c             |  6 +-
>  drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c  | 22 +++---
>  drivers/net/ethernet/apm/xgene-v2/ethtool.c   | 13 +---
>  .../ethernet/apm/xgene/xgene_enet_ethtool.c   | 13 +---
>  drivers/net/ethernet/atheros/atlx/atl1.c      |  8 +-
>  .../ethernet/broadcom/asp2/bcmasp_ethtool.c   |  5 +-
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 10 +--
>  drivers/net/ethernet/broadcom/bcmsysport.c    | 16 ++--
>  drivers/net/ethernet/broadcom/bgmac.c         |  3 +-
>  .../net/ethernet/broadcom/genet/bcmgenet.c    |  5 +-
>  drivers/net/ethernet/cadence/macb_main.c      | 19 ++---
>  drivers/net/ethernet/calxeda/xgmac.c          |  9 +--
>  .../ethernet/cavium/liquidio/lio_ethtool.c    | 50 +++++-------
>  .../ethernet/cavium/thunder/nicvf_ethtool.c   | 48 ++++--------
>  .../net/ethernet/cisco/enic/enic_ethtool.c    | 40 ++++------
>  .../net/ethernet/emulex/benet/be_ethtool.c    | 39 ++++------
>  drivers/net/ethernet/engleder/tsnep_ethtool.c | 32 ++++----
>  .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 38 +++------
>  .../ethernet/freescale/dpaa2/dpaa2-ethtool.c  | 15 ++--
>  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 +-
>  .../freescale/dpaa2/dpaa2-switch-ethtool.c    | 12 ++-
>  .../ethernet/freescale/enetc/enetc_ethtool.c  | 33 +++-----
>  .../net/ethernet/freescale/gianfar_ethtool.c  |  8 +-
>  .../net/ethernet/freescale/ucc_geth_ethtool.c | 23 +++---
>  .../ethernet/hisilicon/hns/hns_dsaf_main.c    | 66 ++++++----------
>  .../hns3/hns3_common/hclge_comm_tqp_stats.c   |  6 +-
>  .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  9 +--
>  .../hisilicon/hns3/hns3pf/hclge_main.c        | 49 +++++-------
>  drivers/net/ethernet/ibm/ibmveth.c            |  4 +-
>  drivers/net/ethernet/ibm/ibmvnic.c            | 30 +++----
>  .../net/ethernet/intel/e1000/e1000_ethtool.c  | 13 ++--
>  drivers/net/ethernet/intel/e1000e/ethtool.c   | 13 ++--
>  drivers/net/ethernet/intel/igbvf/ethtool.c    |  9 +--
>  drivers/net/ethernet/intel/ixgbevf/ethtool.c  | 35 ++++-----
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 38 +++------
>  .../marvell/octeon_ep/octep_ethtool.c         | 34 +++-----
>  .../marvell/octeon_ep_vf/octep_vf_ethtool.c   | 37 ++++-----
>  .../marvell/octeontx2/nic/otx2_ethtool.c      | 78 +++++++------------
>  drivers/net/ethernet/marvell/skge.c           |  3 +-
>  drivers/net/ethernet/marvell/sky2.c           |  3 +-
>  .../mellanox/mlxsw/spectrum_ethtool.c         | 77 +++++++-----------
>  .../ethernet/mellanox/mlxsw/spectrum_ptp.c    |  7 +-
>  drivers/net/ethernet/micrel/ksz884x.c         |  5 +-
>  .../microchip/lan966x/lan966x_ethtool.c       |  3 +-
>  .../ethernet/microsoft/mana/mana_ethtool.c    | 55 +++++--------
>  drivers/net/ethernet/mscc/ocelot_stats.c      |  3 +-
>  .../ethernet/netronome/nfp/nfp_net_ethtool.c  |  3 +-
>  .../oki-semi/pch_gbe/pch_gbe_ethtool.c        |  8 +-
>  .../qlogic/netxen/netxen_nic_ethtool.c        | 10 +--
>  .../net/ethernet/qlogic/qede/qede_ethtool.c   | 34 ++++----
>  .../ethernet/qlogic/qlcnic/qlcnic_ethtool.c   | 49 +++++-------
>  .../net/ethernet/qualcomm/emac/emac-ethtool.c |  7 +-
>  drivers/net/ethernet/rocker/rocker_main.c     |  7 +-
>  .../ethernet/samsung/sxgbe/sxgbe_ethtool.c    |  9 +--
>  drivers/net/ethernet/sfc/ethtool_common.c     | 21 +++--
>  drivers/net/ethernet/sfc/falcon/ethtool.c     | 14 ++--
>  drivers/net/ethernet/sfc/falcon/nic.c         |  7 +-
>  drivers/net/ethernet/sfc/nic.c                |  7 +-
>  .../net/ethernet/sfc/siena/ethtool_common.c   | 25 +++---
>  drivers/net/ethernet/sfc/siena/nic.c          |  7 +-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 60 ++++++--------
>  .../stmicro/stmmac/stmmac_selftests.c         |  7 +-
>  drivers/net/ethernet/sun/cassini.c            |  6 +-
>  .../ethernet/synopsys/dwc-xlgmac-ethtool.c    |  8 +-
>  drivers/net/ethernet/ti/am65-cpsw-ethtool.c   | 20 ++---
>  drivers/net/ethernet/ti/cpsw_ethtool.c        | 15 ++--
>  drivers/net/ethernet/ti/netcp_ethss.c         |  7 +-
>  drivers/net/fjes/fjes_ethtool.c               | 52 +++++--------
>  drivers/net/phy/aquantia/aquantia_main.c      |  3 +-
>  drivers/net/phy/bcm-phy-lib.c                 |  3 +-
>  drivers/net/usb/cdc_ncm.c                     |  8 +-
>  drivers/net/xen-netback/interface.c           |  3 +-
>  drivers/net/xen-netfront.c                    |  3 +-
>  net/dsa/user.c                                | 11 ++-
>  82 files changed, 550 insertions(+), 966 deletions(-)
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
> index 9201f07839ad..2bb1832d21bc 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1180,11 +1180,8 @@ static const struct b53_io_ops bcm_sf2_io_ops =3D =
{
>  static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
>                                    u32 stringset, uint8_t *data)
>  {
> -       int cnt =3D b53_get_sset_count(ds, port, stringset);
> -
>         b53_get_strings(ds, port, stringset, data);
> -       bcm_sf2_cfp_get_strings(ds, port, stringset,
> -                               data + cnt * ETH_GSTRING_LEN);
> +       bcm_sf2_cfp_get_strings(ds, port, stringset, data);
>  }
>
>  static void bcm_sf2_sw_get_ethtool_stats(struct dsa_switch *ds, int port=
,
> diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.=
c
> index c88ee3dd4299..8ba23e643a42 100644
> --- a/drivers/net/dsa/bcm_sf2_cfp.c
> +++ b/drivers/net/dsa/bcm_sf2_cfp.c
> @@ -1284,22 +1284,15 @@ void bcm_sf2_cfp_get_strings(struct dsa_switch *d=
s, int port,
>  {
>         struct bcm_sf2_priv *priv =3D bcm_sf2_to_priv(ds);
>         unsigned int s =3D ARRAY_SIZE(bcm_sf2_cfp_stats);
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
> +               for (j =3D 0; j < s; j++)
> +                       ethtool_sprintf(&data, "CFP%03d_%sCntr", i,
> +                                       bcm_sf2_cfp_stats[j].name);
>  }
>
>  void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
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
> index 4e8710c7cb7b..408ccb1f012e 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -2113,8 +2113,7 @@ static void ksz_get_strings(struct dsa_switch *ds, =
int port,
>                 return;
>
>         for (i =3D 0; i < dev->info->mib_cnt; i++) {
> -               memcpy(buf + i * ETH_GSTRING_LEN,
> -                      dev->info->mib_names[i].string, ETH_GSTRING_LEN);
> +               ethtool_puts(&buf, dev->info->mib_names[i].string);
>         }
>  }
>
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx=
/chip.c
> index 69cf19d3dd5e..bc813d97afa7 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -1220,12 +1220,9 @@ static void mv88e6xxx_get_strings(struct dsa_switc=
h *ds, int port,
>         if (chip->info->ops->stats_get_strings)
>                 count =3D chip->info->ops->stats_get_strings(chip, data);
>
> -       if (chip->info->ops->serdes_get_strings) {
> -               data +=3D count * ETH_GSTRING_LEN;
> +       if (chip->info->ops->serdes_get_strings)
>                 count =3D chip->info->ops->serdes_get_strings(chip, port,=
 data);
> -       }
>
> -       data +=3D count * ETH_GSTRING_LEN;
>         mv88e6xxx_atu_vtu_get_strings(data);
>
>         mv88e6xxx_reg_unlock(chip);
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 1135a32e4b7e..b3e127f64b08 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -803,8 +803,7 @@ static void a5psw_get_strings(struct dsa_switch *ds, =
int port, u32 stringset,
>                 return;
>
>         for (u =3D 0; u < ARRAY_SIZE(a5psw_stats); u++) {
> -               memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
> -                      ETH_GSTRING_LEN);
> +               ethtool_puts(&data, a5psw_stats[u].name);
>         }
>  }
>
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

