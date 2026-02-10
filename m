Return-Path: <linux-renesas-soc+bounces-28134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPvfBRA0i2mhRgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 14:35:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1711B3E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 14:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A81E3028006
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0279329390;
	Tue, 10 Feb 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xClPmlTp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C5324B26
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730491; cv=pass; b=nTR5uaHaSQGkvv8y8bWc1Ge33qp3kElbIIc4qxUM/wpadCGz0sdrxNfRDhwPvTzf39dIMwoPZeB44AdZChnBzVXcEDL+byIALjxL4Tj7T2mKA7TL7at+nAMKATesOcTyEmSVdbQMjvYYU3tnZ6Nllh7j/eij/ZrCMsfzc4W7atw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730491; c=relaxed/simple;
	bh=AdpjSw7dNkdr+/tjYVp8tYBCboA8uj/PFr3NOiu6QnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH5SXN+iIg4hmLxXOZkAMFaRyWHjKtlYkahtyrD8OP+dkMNzSFL0axt1ObdDhxoAGp2iT7V4N4X99clkeIHzzBdILXsqygd9+I1OHwLWUuHHwfpN6gRFyW77hZEwgg+O0i89l8FWC97hxYn7r96ld0k0KtS1b2ndaQSDYGYtja4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xClPmlTp; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ad9fabd08so2657289d50.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 05:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770730489; cv=none;
        d=google.com; s=arc-20240605;
        b=DUegWi8V9/8EDemOe0RBmxYD+3+8ScqenacWuURW5cX0cFa1b93ufXb76wXbdljiyb
         XY+iIE9oUBzqlsbzoLynUby7JVSkoHaU4iKnOg1pIWe3BRRqLE0seL5OIoaLlospR1zj
         X/szYyVRd0+q2okZ4rqvHqU8I0lTMHVUOde/iGi5J6YzCAW27BwShTLpUytf9FzAvHDt
         inac/nF57/ksdp4zYtD2GP/a6uUUt8o89GF4a8pwf0uLqY+k6TOkgPdzmQ0jbMJdkMEh
         LouT3QLY6NXxHBMxrsBJ6WzdZnotc8KRiAqK14GidwhnAsDRAH8hTzm/CKkwraFwbVA5
         +oRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        fh=cEIzkQkMtcuQrTyw/TEMgoQpNotCxjj/td5BwDNkqtk=;
        b=dHbTEzUX194MMVY5kbTF9vPVeasXBAn3Hp8jHS4xcqdJvxoIb2TKQ5H9POBnpy5Tzm
         qXIb4JoEPnC3V0TVSbM31sHbT9zDgl2vIYL26iwNEz5iyIN3NwCF8x51HYfW7xNFGkLz
         pEt4JAMiEy3XwF/VjmYkTgxvVvh4yU5xD0KKxIFB5jDhMTYMk0zTLiSFze7naoC2V7TM
         l+tw3+jU5NHPtwsJlwIRBRjodUDCX6ysSKHPHx5KyIMU9r4s9oNJ8XhuQH+B4Ljby0UB
         XhgSNELo2aWaOYOzZUDs/s9zzYyqEfLiOYMu0MNOVy1oS1Nm6Vj/NVYM4rhgyLV9cO7M
         il6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770730489; x=1771335289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        b=xClPmlTpW83778ogu7Eud87AdTFkK5Y4I3tN0m07H8z5/B5dd+cfmFGGyaSSVyrVDi
         tzg+ya1XVE4Pvenqpeg/8oeXjW7X4IyqTr/UKqJO0zse1lvk/OM/HkUfQTEvAaWjoaae
         /ADxiDrH0cDK6FYyrQ/AArhpdTpKVzCPthnM7YY65W8kmBgepquzR5y6cTi9XKq8HWQK
         qMxzVpOc9WQ5FuA0iQc9mGLTM/YW7S0220kmZPsRn4OcnIhyOAPmBX/KhBTlrW9IbUC+
         Dh0YgD4uc6qoNVG++fqfUW2VdaCIryq0Du5K5OqEuHGSWipPPRmcEie1wIhWOuAgLES5
         BraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730489; x=1771335289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        b=LMzps5P0N0XtFPbdL+VwZx/coPoZdWqnOCjh+fFUbI3OtRNtLFsjp3cF0aRGbewBlj
         2t+e2svi6y3Tnbokid1y8zjrSn1wC920bsesQR0cFBWdYnMw2wK94j6SRnRBvTOnNUGS
         6z/M6okYoK9AZLa0vAmMKu68tnWwkvZpoB2uNlXx84FTjk35ofBCOvHZDQ0aEpaAGz8v
         cQt7z8+KDl9tCd32v1LngixtG0aQ0uZycDKeOG10+4w9p3OnSYePnLimsahkeJX404Qz
         6jLBdZjOjouH0QsKBLqpVMDPoIeNBlUk3ff8WEBhmcVyFjcw++pfF/NVZ/RpBj/0bH6l
         oabA==
X-Forwarded-Encrypted: i=1; AJvYcCVAo+7MUqyqE1u6PZXEsuhbjACAwnVRPjzsHcPyE8CRKFcmgdEDWi2Mq/Kq2rvBBzeiDdNBWwtmbZCDIC1LLXc30Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQq3MbLpbh9Uo9aCKG1D3UqX+a9iKZuP7/YSAeinlEEEYZM4h
	w8SuX/OMwEvbUuEaLjT5o2PrZgtHXPe52tDBHptfwOvgwmqhcGIHMipxMJC1oa952gWhDR7/15H
	g62LFIKoqvp9qUdUeet4Isan2/ysAGu2E/KpY2Ehs3A==
X-Gm-Gg: AZuq6aJUjvb10NmJVJJp3693NpqMOn8VlLx7AVDkz06y2lKQY7DIlURA/g7J2SFmFG0
	G3V2hEshCILTLWpxO2Zwytwg1U9KN4FXpUv1OjJNrM1pWWP6zRIMSdMbRvbExnzXJL+hlE37VG4
	+SMAkU8YCkUg4/o2GJ26/l/zy4qce/F995EzIG9Ai+ST2PRNJLZsbkua8u70ARL3ZUN1TaYTcqe
	d9kqja+y4QRVGEpt+B9s1w1xE6cLlvFkxz+7jNhcW7udfgLH9k5F6LsO3qZ2zjb24mA1h8BKimS
	FtAOIY9brCeCUkC++YE=
X-Received: by 2002:a05:690e:4082:b0:649:f272:4e71 with SMTP id
 956f58d0204a3-64af2194733mr1895375d50.61.1770730489200; Tue, 10 Feb 2026
 05:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
In-Reply-To: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Feb 2026 14:34:11 +0100
X-Gm-Features: AZwV_Qh7YZqJ6fn57eqSKDNnShG5y8_vQaT5Jjd2bk1tO-PMV5NbiA4MiAomS4E
Message-ID: <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
To: Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Josua Mayer <josua@solid-run.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28134-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,glider.be:email]
X-Rspamd-Queue-Id: 6DD1711B3E2
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Now the mux core provides devm_mux_state_get_optional():
>
>     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declara=
tion of =E2=80=98devm_mux_state_get_optional=E2=80=99 follows non-static
>      declaration
>       944 | devm_mux_state_get_optional(struct device *dev, const char *m=
ux_name)
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
>     include/linux/mux/consumer.h:64:19: note: previous declaration of =E2=
=80=98devm_mux_state_get_optional=E2=80=99 with type =E2=80=98struct mux_st=
ate *(struct device *, const char *)=E2=80=99
>        64 | struct mux_state *devm_mux_state_get_optional(struct device *=
dev, const char *mux_name);
>           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by dropping the temporary local wrapper.
>
> Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional =
and selected mux-state")
> Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for=
 phyrst management")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert for helping out!

> ---
>   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
>     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.or=
g
>   - 8bb92fd7a0407792 is in phy/next

Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
or do you prefer me to handle it?

Kind regards
Uffe

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index cfc2a8d9028d58d0..65cbf330bd8fa10c 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -939,16 +939,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_registe=
r(struct rcar_gen3_chan *cha
>         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(cha=
nnel, enable);
>  }
>
> -/* Temporary wrapper until the multiplexer subsystem supports optional m=
uxes */
> -static inline struct mux_state *
> -devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> -{
> -       if (!of_property_present(dev->of_node, "mux-states"))
> -               return NULL;
> -
> -       return devm_mux_state_get(dev, mux_name);
> -}
> -
>  static void rcar_gen3_phy_mux_state_deselect(void *data)
>  {
>         mux_state_deselect(data);
> --
> 2.43.0
>

