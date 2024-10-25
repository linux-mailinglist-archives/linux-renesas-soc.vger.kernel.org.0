Return-Path: <linux-renesas-soc+bounces-10167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB939B134E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 01:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF8A1F22641
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 23:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABF020C301;
	Fri, 25 Oct 2024 23:35:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from trager.us (trager.us [52.5.81.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E77157E99;
	Fri, 25 Oct 2024 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.5.81.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899302; cv=none; b=DBJUuyL/cyTSQPn04Ldvh5NiGqf9fDPPnmNyaPdtJeqztKA4QJADiKv6FIajD3lSlCyEGEkqKtH8HxWmnu5EqpLBLlV4bZhnr1noZSY1bPwyPtk5DD3yGVG+SaSM+MK4Y44jE0GWYQvNfgfYDr20DtbMEFzBzEjHpC89XhL1CM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899302; c=relaxed/simple;
	bh=3JW+04Citxx0VhZE3Fw01lz/nVOh0BZ7V5GYOOzp7eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDWChvxvjv26LiloH1XjnEUVrK2D0+9SMzV+6VMjzH35OBTWpIuBdoX+gE9F7gezvjXMcA7DXIn5Mj0w8Iv2qNuXRUbC5AT6Ukokffp6ALUq37NPCkJLpNFNVmT3jLwTO+W74rlyjzD6CwOb0DoabJGJj/j1dFmSC7QjX/naXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trager.us; spf=pass smtp.mailfrom=trager.us; arc=none smtp.client-ip=52.5.81.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trager.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trager.us
Received: from c-76-104-255-50.hsd1.wa.comcast.net ([76.104.255.50] helo=[192.168.1.226])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1t4Tpa-0002Gi-Q3; Fri, 25 Oct 2024 23:34:58 +0000
Message-ID: <fcc0ff8c-85c6-4ba6-8c1f-541451fca409@trager.us>
Date: Fri, 25 Oct 2024 16:34:50 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 net-next] net: dsa: use ethtool string helpers
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh
 <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>,
 George McCollister <george.mccollister@gmail.com>,
 Simon Horman <horms@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>
References: <20241025200807.189223-1-rosenp@gmail.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20241025200807.189223-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Lee Trager <lee@trager.us>

On 10/25/24 1:08 PM, Rosen Penev wrote:
> These are the preferred way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (for hellcreek driver)
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>   v4: add back pointer math for b53_get_strings. Needed as prototype
>   can't be change to double pointer.
>   v3: remove curly braces from ksz_common.c
>   v2: remove curly braces from rzn1_a5psw.c
>   drivers/net/dsa/b53/b53_common.c          |  3 +--
>   drivers/net/dsa/bcm_sf2.c                 |  4 ++--
>   drivers/net/dsa/bcm_sf2.h                 |  2 +-
>   drivers/net/dsa/bcm_sf2_cfp.c             | 20 ++++++--------------
>   drivers/net/dsa/dsa_loop.c                |  3 +--
>   drivers/net/dsa/hirschmann/hellcreek.c    |  8 ++------
>   drivers/net/dsa/microchip/ksz_common.c    |  6 ++----
>   drivers/net/dsa/mv88e6xxx/chip.c          | 17 ++---------------
>   drivers/net/dsa/mv88e6xxx/serdes.c        |  6 ++----
>   drivers/net/dsa/rzn1_a5psw.c              |  6 ++----
>   drivers/net/dsa/sja1105/sja1105_ethtool.c |  7 ++-----
>   drivers/net/dsa/xrs700x/xrs700x.c         |  6 ++----
>   net/dsa/user.c                            | 13 +++++--------
>   13 files changed, 30 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index c39cb119e760..285785c942b0 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -989,8 +989,7 @@ void b53_get_strings(struct dsa_switch *ds, int port, u32 stringset,
>   
>   	if (stringset == ETH_SS_STATS) {
>   		for (i = 0; i < mib_size; i++)
> -			strscpy(data + i * ETH_GSTRING_LEN,
> -				mibs[i].name, ETH_GSTRING_LEN);
> +			ethtool_puts(&data, mibs[i].name);
>   	} else if (stringset == ETH_SS_PHY_STATS) {
>   		phydev = b53_get_phy_device(ds, port);
>   		if (!phydev)
> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 9201f07839ad..43bde1f583ff 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1183,8 +1183,8 @@ static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
>   	int cnt = b53_get_sset_count(ds, port, stringset);
>   
>   	b53_get_strings(ds, port, stringset, data);
> -	bcm_sf2_cfp_get_strings(ds, port, stringset,
> -				data + cnt * ETH_GSTRING_LEN);
> +	data += cnt * ETH_GSTRING_LEN;
> +	bcm_sf2_cfp_get_strings(ds, port, stringset, &data);
>   }
>   
>   static void bcm_sf2_sw_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/bcm_sf2.h b/drivers/net/dsa/bcm_sf2.h
> index 4fda075a3449..e61e3bf688ff 100644
> --- a/drivers/net/dsa/bcm_sf2.h
> +++ b/drivers/net/dsa/bcm_sf2.h
> @@ -229,7 +229,7 @@ int bcm_sf2_cfp_rst(struct bcm_sf2_priv *priv);
>   void bcm_sf2_cfp_exit(struct dsa_switch *ds);
>   int bcm_sf2_cfp_resume(struct dsa_switch *ds);
>   void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
> -			     u32 stringset, uint8_t *data);
> +			     u32 stringset, uint8_t **data);
>   void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
>   				   uint64_t *data);
>   int bcm_sf2_cfp_get_sset_count(struct dsa_switch *ds, int port, int sset);
> diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
> index c88ee3dd4299..95991334561e 100644
> --- a/drivers/net/dsa/bcm_sf2_cfp.c
> +++ b/drivers/net/dsa/bcm_sf2_cfp.c
> @@ -1280,26 +1280,18 @@ static const struct bcm_sf2_cfp_stat {
>   };
>   
>   void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
> -			     u32 stringset, uint8_t *data)
> +			     u32 stringset, uint8_t **data)
>   {
>   	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
> -	unsigned int s = ARRAY_SIZE(bcm_sf2_cfp_stats);
> -	char buf[ETH_GSTRING_LEN];
> -	unsigned int i, j, iter;
> +	unsigned int i, j;
>   
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
> -	for (i = 1; i < priv->num_cfp_rules; i++) {
> -		for (j = 0; j < s; j++) {
> -			snprintf(buf, sizeof(buf),
> -				 "CFP%03d_%sCntr",
> -				 i, bcm_sf2_cfp_stats[j].name);
> -			iter = (i - 1) * s + j;
> -			strscpy(data + iter * ETH_GSTRING_LEN,
> -				buf, ETH_GSTRING_LEN);
> -		}
> -	}
> +	for (i = 1; i < priv->num_cfp_rules; i++)
> +		for (j = 0; j < ARRAY_SIZE(bcm_sf2_cfp_stats); j++)
> +			ethtool_sprintf(data, "CFP%03d_%sCntr", i,
> +					bcm_sf2_cfp_stats[j].name);
>   }
>   
>   void bcm_sf2_cfp_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
> index c70ed67cc188..adbab544c60f 100644
> --- a/drivers/net/dsa/dsa_loop.c
> +++ b/drivers/net/dsa/dsa_loop.c
> @@ -121,8 +121,7 @@ static void dsa_loop_get_strings(struct dsa_switch *ds, int port,
>   		return;
>   
>   	for (i = 0; i < __DSA_LOOP_CNT_MAX; i++)
> -		memcpy(data + i * ETH_GSTRING_LEN,
> -		       ps->ports[port].mib[i].name, ETH_GSTRING_LEN);
> +		ethtool_puts(&data, ps->ports[port].mib[i].name);
>   }
>   
>   static void dsa_loop_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
> index d798f17cf7ea..283ec5a6e23c 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> @@ -294,12 +294,8 @@ static void hellcreek_get_strings(struct dsa_switch *ds, int port,
>   {
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(hellcreek_counter); ++i) {
> -		const struct hellcreek_counter *counter = &hellcreek_counter[i];
> -
> -		strscpy(data + i * ETH_GSTRING_LEN,
> -			counter->name, ETH_GSTRING_LEN);
> -	}
> +	for (i = 0; i < ARRAY_SIZE(hellcreek_counter); ++i)
> +		ethtool_puts(&data, hellcreek_counter[i].name);
>   }
>   
>   static int hellcreek_get_sset_count(struct dsa_switch *ds, int port, int sset)
> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
> index 5290f5ad98f3..f73833e24622 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -2112,10 +2112,8 @@ static void ksz_get_strings(struct dsa_switch *ds, int port,
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
> -	for (i = 0; i < dev->info->mib_cnt; i++) {
> -		memcpy(buf + i * ETH_GSTRING_LEN,
> -		       dev->info->mib_names[i].string, ETH_GSTRING_LEN);
> -	}
> +	for (i = 0; i < dev->info->mib_cnt; i++)
> +		ethtool_puts(&buf, dev->info->mib_names[i].string);
>   }
>   
>   /**
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
> index 4f5193d86e65..1893fed00467 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -1162,8 +1162,7 @@ static int mv88e6xxx_stats_get_strings(struct mv88e6xxx_chip *chip,
>   	for (i = 0, j = 0; i < ARRAY_SIZE(mv88e6xxx_hw_stats); i++) {
>   		stat = &mv88e6xxx_hw_stats[i];
>   		if (stat->type & types) {
> -			memcpy(data + j * ETH_GSTRING_LEN, stat->string,
> -			       ETH_GSTRING_LEN);
> +			ethtool_puts(&data, stat->string);
>   			j++;
>   		}
>   	}
> @@ -1204,31 +1203,19 @@ static void mv88e6xxx_atu_vtu_get_strings(uint8_t *data)
>   	unsigned int i;
>   
>   	for (i = 0; i < ARRAY_SIZE(mv88e6xxx_atu_vtu_stats_strings); i++)
> -		strscpy(data + i * ETH_GSTRING_LEN,
> -			mv88e6xxx_atu_vtu_stats_strings[i],
> -			ETH_GSTRING_LEN);
> +		ethtool_puts(&data, mv88e6xxx_atu_vtu_stats_strings[i]);
>   }
>   
>   static void mv88e6xxx_get_strings(struct dsa_switch *ds, int port,
>   				  u32 stringset, uint8_t *data)
>   {
>   	struct mv88e6xxx_chip *chip = ds->priv;
> -	int count = 0;
>   
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
>   	mv88e6xxx_reg_lock(chip);
>   
> -	if (chip->info->ops->stats_get_strings)
> -		count = chip->info->ops->stats_get_strings(chip, data);
> -
> -	if (chip->info->ops->serdes_get_strings) {
> -		data += count * ETH_GSTRING_LEN;
> -		count = chip->info->ops->serdes_get_strings(chip, port, data);
> -	}
> -
> -	data += count * ETH_GSTRING_LEN;
>   	mv88e6xxx_atu_vtu_get_strings(data);
>   
>   	mv88e6xxx_reg_unlock(chip);
> diff --git a/drivers/net/dsa/mv88e6xxx/serdes.c b/drivers/net/dsa/mv88e6xxx/serdes.c
> index 01ea53940786..327831d2b547 100644
> --- a/drivers/net/dsa/mv88e6xxx/serdes.c
> +++ b/drivers/net/dsa/mv88e6xxx/serdes.c
> @@ -144,8 +144,7 @@ int mv88e6352_serdes_get_strings(struct mv88e6xxx_chip *chip,
>   
>   	for (i = 0; i < ARRAY_SIZE(mv88e6352_serdes_hw_stats); i++) {
>   		stat = &mv88e6352_serdes_hw_stats[i];
> -		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
> -		       ETH_GSTRING_LEN);
> +		ethtool_puts(&data, stat->string);
>   	}
>   	return ARRAY_SIZE(mv88e6352_serdes_hw_stats);
>   }
> @@ -405,8 +404,7 @@ int mv88e6390_serdes_get_strings(struct mv88e6xxx_chip *chip,
>   
>   	for (i = 0; i < ARRAY_SIZE(mv88e6390_serdes_hw_stats); i++) {
>   		stat = &mv88e6390_serdes_hw_stats[i];
> -		memcpy(data + i * ETH_GSTRING_LEN, stat->string,
> -		       ETH_GSTRING_LEN);
> +		ethtool_puts(&data, stat->string);
>   	}
>   	return ARRAY_SIZE(mv88e6390_serdes_hw_stats);
>   }
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 1135a32e4b7e..66974379334a 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -802,10 +802,8 @@ static void a5psw_get_strings(struct dsa_switch *ds, int port, u32 stringset,
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
> -	for (u = 0; u < ARRAY_SIZE(a5psw_stats); u++) {
> -		memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
> -		       ETH_GSTRING_LEN);
> -	}
> +	for (u = 0; u < ARRAY_SIZE(a5psw_stats); u++)
> +		ethtool_puts(&data, a5psw_stats[u].name);
>   }
>   
>   static void a5psw_get_ethtool_stats(struct dsa_switch *ds, int port,
> diff --git a/drivers/net/dsa/sja1105/sja1105_ethtool.c b/drivers/net/dsa/sja1105/sja1105_ethtool.c
> index decc6c931dc1..2ea64b1d026d 100644
> --- a/drivers/net/dsa/sja1105/sja1105_ethtool.c
> +++ b/drivers/net/dsa/sja1105/sja1105_ethtool.c
> @@ -586,7 +586,6 @@ void sja1105_get_strings(struct dsa_switch *ds, int port,
>   {
>   	struct sja1105_private *priv = ds->priv;
>   	enum sja1105_counter_index max_ctr, i;
> -	char *p = data;
>   
>   	if (stringset != ETH_SS_STATS)
>   		return;
> @@ -597,10 +596,8 @@ void sja1105_get_strings(struct dsa_switch *ds, int port,
>   	else
>   		max_ctr = __MAX_SJA1105PQRS_PORT_COUNTER;
>   
> -	for (i = 0; i < max_ctr; i++) {
> -		strscpy(p, sja1105_port_counters[i].name, ETH_GSTRING_LEN);
> -		p += ETH_GSTRING_LEN;
> -	}
> +	for (i = 0; i < max_ctr; i++)
> +		ethtool_puts(&data, sja1105_port_counters[i].name);
>   }
>   
>   int sja1105_get_sset_count(struct dsa_switch *ds, int port, int sset)
> diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/xrs700x.c
> index de3b768f2ff9..4dbcc49a9e52 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x.c
> @@ -91,10 +91,8 @@ static void xrs700x_get_strings(struct dsa_switch *ds, int port,
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
> -	for (i = 0; i < ARRAY_SIZE(xrs700x_mibs); i++) {
> -		strscpy(data, xrs700x_mibs[i].name, ETH_GSTRING_LEN);
> -		data += ETH_GSTRING_LEN;
> -	}
> +	for (i = 0; i < ARRAY_SIZE(xrs700x_mibs); i++)
> +		ethtool_puts(&data, xrs700x_mibs[i].name);
>   }
>   
>   static int xrs700x_get_sset_count(struct dsa_switch *ds, int port, int sset)
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index 91a1fa5f8ab0..f7b0630dd2b6 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -1042,15 +1042,12 @@ static void dsa_user_get_strings(struct net_device *dev,
>   	struct dsa_switch *ds = dp->ds;
>   
>   	if (stringset == ETH_SS_STATS) {
> -		int len = ETH_GSTRING_LEN;
> -
> -		strscpy_pad(data, "tx_packets", len);
> -		strscpy_pad(data + len, "tx_bytes", len);
> -		strscpy_pad(data + 2 * len, "rx_packets", len);
> -		strscpy_pad(data + 3 * len, "rx_bytes", len);
> +		ethtool_puts(&data, "tx_packets");
> +		ethtool_puts(&data, "tx_bytes");
> +		ethtool_puts(&data, "rx_packets");
> +		ethtool_puts(&data, "rx_bytes");
>   		if (ds->ops->get_strings)
> -			ds->ops->get_strings(ds, dp->index, stringset,
> -					     data + 4 * len);
> +			ds->ops->get_strings(ds, dp->index, stringset, data);
>   	} else if (stringset ==  ETH_SS_TEST) {
>   		net_selftest_get_strings(data);
>   	}

