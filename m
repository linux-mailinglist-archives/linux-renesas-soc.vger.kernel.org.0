Return-Path: <linux-renesas-soc+bounces-27613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJbSKZ2Fe2mvFAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:06:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D819B1D29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F91230039BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6043382C3;
	Thu, 29 Jan 2026 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXCleRDE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6633122E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702811; cv=pass; b=UI9Z6Dvm7BSM2YG7JE4fXjCnjuYyuMgrOBlt0lRtFU9PuwK/iy8dIu/gRVY92MPwMK/uaTGPFZWSbRvDNsZ43p/Knea1MIZNXFxvRll+1O9LE1F7Btirz2pt8o0dRdFdsSQXMHZpPXYGv7pW/jM/zRfSAYT8uH+DnmmIaAwFlS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702811; c=relaxed/simple;
	bh=07694nkibp+Ukt/3oCjWp5i0EIYQ4hrhXlidSnaNpN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4E+iRifq35fcuJQwlCB34h4myA3TiCAi4tq/Iw1aSfmw2qkoYGNuuEGKeM+NN4Udp0O+2D6nvsKiWdoS43ZRIyMhocrVb4kffCfFDwV97XDDXdkqfwQa6/C9SLrvCHeAIc64l+LZ8NR0nkxGc2UHfy+HeEnGc3d7x8Z7zM8smE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXCleRDE; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso1198873e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 08:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769702807; cv=none;
        d=google.com; s=arc-20240605;
        b=hBmkqRBDoXAOadzumW2/TCH7TDlCP0QQ8YOWNVAf383MlQVTg9HJM8HXuTUstculiO
         Nh9s2TV7sPqQytAIGrkh+LvWD8Ab8uv9o5wlKkSD6tgGjxVcrUfYV37dm1YpLOAYQNO7
         3CREqy+yr+vB/rY0t4QGkudcHTFqMa+SY+l6SfGYjZ+XGfMi3OA4jWKxuIETWJM/8i7d
         SQV2lZe31dxfJaVwnsatPCHwxDuefDykOxqOseArOgfs6HDchZwwczcmfezRTt0bGIJ7
         duKpTima7diR4nP4GqLsYUsYF/hktB2vbHeBL8qGqO28jRjnn64S1BBhsC6MSn8iEWWg
         v6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sjBE9CcEx3FGX02UcUqw+G+HOHlTgyZhIWMhdAQnoXg=;
        fh=g63ty4gJE0yMNaqC46fouAuguFWBlxfNZpJ39NuYgts=;
        b=kpD6GxsK/dSZmZfwyCp4kNC+0B+x9LhXH0nD+qDijx4ueR20WTz3DwhSSu3nDj3FJp
         92Oo6eTQYdFhz7kGmcgqF4ZR5DHqedR5RzGMeUA7W9BoztS4xIShEjIrVDTQJMDCLgCh
         N8oPkAtvsEN46EF3XrUDmRbw5pVae+NQwuVa6d9q8tFooaFDRQgjvIAKynxQXcksEirW
         9XZsxzVrrrkvfue8RBZ+YD81+v910SVrk4OPg8cvfkdl0KAtcwmG6loTmpEws0VwUXcX
         d1um2IJK84yLA7z2TT/t9skFa3qFO5+fKUY/h4OBs9gC4LqwUZcAnTCgJVGuHxRubLAE
         aizg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769702807; x=1770307607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sjBE9CcEx3FGX02UcUqw+G+HOHlTgyZhIWMhdAQnoXg=;
        b=DXCleRDExChl/h8Dg365AhW/r2JRAOHymIXupLWJFbwgmikGA4eODDcSKgC+rsAUw8
         Gbtqv3xam1Iq2YgyRShLO6ZY+gE7W1cb5FSqCtwdFbAFpfZ20B5S5hBZ0c5QfL/Y3kp3
         0fkeMTyY4dpHbo68v70VVRELvZymtLFJBdr7P83S9290IfRJ6mvImZdqKzYo+DOYNRmM
         GRRF70fAKQBP5txyVS77t55eFa3cu8f7N8k6hKVThxV31rX3xacnejRqFHLA+NyG464d
         jCbjC3xPS0kQM2aoDQNfidex/DN41SePdLmegi0BMnL9PuGWZirC8TW/c64TVnhi0LnV
         9fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702807; x=1770307607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjBE9CcEx3FGX02UcUqw+G+HOHlTgyZhIWMhdAQnoXg=;
        b=k1r7HM56QjWRQBWpjs1eMdCb8c7XprlJ+6KmmTx4uFoW5UlWOw3xCAmHU/zfI0bS2O
         9Y0fOJ/IHDLcMIR0QoPcG9oc9Xhr3oTCI8g3t2udebuYdOM31oL+nvHXTdbRQhPeuTG5
         jUZ5DOAsG5KuMvkfOqhoYtpbqqFANHgRYWVdlXA1zDUopJg8kEsVH/5TeZM5cmZmNamZ
         eysc0qGIr/XAg7khjlKsu1or/qyAqkIA16R7tXNLiWEgSEQN43d/s7uPkjZ7tD03f8pa
         6WWRemA26K6VFtWobJSdb9zxku9vwKrHMruXGNVJK0R5ndqvIms5Qif6yBeM3vQuXYWX
         iOHw==
X-Forwarded-Encrypted: i=1; AJvYcCWXUNTwiHI1HDHfJrc759yh70MV9tUSkQF21ZVoHnehPSbtM5G+L9CT93fkEgFrry/kOr9HHbIcXwGWdhvd59BQDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56FIOtZ+tljnJwYF8wfGHMdA0Iu51/IXoToJeKTrh5sQmV4u+
	Br/o+U9ELPQbAWQ2IV4LrzyEdLymGjLGgQ8vVduFW3LeXsHKFfZQndqILA1HBBKtDF6SUA3DJ/p
	W3q5K6Fx+SCIxtBKUHRFTnRHxpzjJNK35F0ezJIdaOg==
X-Gm-Gg: AZuq6aKXM2mvDahKh6C3w507xBL37IL6Um4/6Mq/tel+CaCeSRyW/hGFxIZpjLg+xi5
	NO/tXzu6mwa5onWMXm7Q+AdV6ZCiJ4lPFcRepFFVxfXftKM+jbihD2yu4+LoS0tJnOKE4WgT7nW
	iOcOiQpqaJNNGs2JFG1NuXaiXyZSPR4cAZwn982r2DWK0fwj9UyV8YJqiQeh0HeDCjlhfIIp6dv
	Gf3b3AAn0gjTbu6OnBa9Hum/xpErbavgpak3R5VE4JU+HVJ+sZCWaop/stX8Ueb7zpofGb6
X-Received: by 2002:a05:6512:234e:b0:59d:d799:b7a0 with SMTP id
 2adb3069b0e04-59e040299admr4006653e87.36.1769702806877; Thu, 29 Jan 2026
 08:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rz-sdio-mux-v7-0-92ebb6da0df8@solid-run.com> <20260128-rz-sdio-mux-v7-2-92ebb6da0df8@solid-run.com>
In-Reply-To: <20260128-rz-sdio-mux-v7-2-92ebb6da0df8@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Jan 2026 17:06:10 +0100
X-Gm-Features: AZwV_QhXWgEPoSG5cEeDEK7X9sYP3SyTXeMqEgA9rOrQCY9Is43DwQw7rMGTcAc
Message-ID: <CAPDyKFrBuL+747QUJJUejtcvjm0V7Lt=vHwjvcMdCt_h4=sFwg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27613-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D819B1D29
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 at 15:46, Josua Mayer <josua@solid-run.com> wrote:
>
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - mux_control_get_optional:
>   Get a mux-control if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_selected:
>   Get and select a mux-state specified in dt, return error otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to take an extra argument
> indicating whether the mux is optional.
> In this case no error is printed, and NULL returned in case of ENOENT.
>
> Calling code is adapted to handle NULL return case, and to pass optional
> argument as required.
>
> To support automatic deselect for _selected helper, a new structure is
> created storing an exit pointer similar to clock core which is called on
> release.
>
> To facilitate code sharing between optional/mandatory/selected helpers,
> a new internal helper function is added to handle quiet (optional) and
> verbose (mandatory) errors, as well as storing the correct callback for
> devm release: __devm_mux_state_get
>
> Due to this structure devm_mux_state_get_*_selected can no longer print
> a useful error message when select fails. Instead callers should print
> errors where needed.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. The second error message is based on of_parse_phandle_with_args
> return value.
>
> In optional case no error is printed and NULL is returned.
> This ensures that the new helper functions will not confuse the user
> either.
>
> With the addition of optional helper functions it became clear that
> drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
> Add stubs for all symbols exported by mux core.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/mux/core.c           | 178 ++++++++++++++++++++++++++++++++++++-------
>  include/linux/mux/consumer.h | 108 +++++++++++++++++++++++++-
>  2 files changed, 253 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index a3840fe0995f..b01ec126caaf 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c

[...]

>  static void devm_mux_state_release(struct device *dev, void *res)
>  {
> -       struct mux_state *mstate = *(struct mux_state **)res;
> +       struct devm_mux_state_state *devm_state = res;
>
> -       mux_state_put(mstate);
> +       if (devm_state->exit)
> +               devm_state->exit(devm_state->mstate);
> +
> +       mux_state_put(devm_state->mstate);
>  }
>
>  /**
> - * devm_mux_state_get() - Get the mux-state for a device, with resource
> - *                       management.
> - * @dev: The device that needs a mux-control.
> - * @mux_name: The name identifying the mux-control.
> + * __devm_mux_state_get() - Get the optional mux-state for a device,
> + *                         with resource management.
> + * @dev: The device that needs a mux-state.
> + * @mux_name: The name identifying the mux-state.
> + * @optional: Whether to return NULL and silence errors when mux doesn't exist.
> + * @init: Optional function pointer for mux-state object initialisation.
> + * @exit: Optional function pointer for mux-state object cleanup on release.
>   *
>   * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
>   */
> -struct mux_state *devm_mux_state_get(struct device *dev,
> -                                    const char *mux_name)
> +static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
> +                                             bool optional,
> +                                             int (*init)(struct mux_state *mstate),
> +                                             int (*exit)(struct mux_state *mstate))
>  {
> -       struct mux_state **ptr, *mstate;
> +       struct devm_mux_state_state *devm_state;
> +       struct mux_state *mstate;
> +       int ret;
>
> -       ptr = devres_alloc(devm_mux_state_release, sizeof(*ptr), GFP_KERNEL);
> -       if (!ptr)
> +       devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
> +       if (!devm_state)
>                 return ERR_PTR(-ENOMEM);
>
> -       mstate = mux_state_get(dev, mux_name);
> -       if (IS_ERR(mstate)) {
> -               devres_free(ptr);
> -               return mstate;
> +       mstate = mux_state_get(dev, mux_name, optional);
> +       if (IS_ERR_OR_NULL(mstate)) {
> +               ret = PTR_ERR(mstate);

Should this be PTR_ERR_OR_ZERO?

> +               goto err_mux_state_get;
>         }
>
> -       *ptr = mstate;
> -       devres_add(dev, ptr);
> +       if (init) {
> +               ret = init(mstate);
> +               if (ret)
> +                       goto err_mux_state_init;
> +       }
> +
> +       devm_state->mstate = mstate;
> +       devm_state->exit = exit;
> +       devres_add(dev, devm_state);
>
>         return mstate;
> +
> +err_mux_state_init:
> +       mux_state_put(mstate);
> +err_mux_state_get:
> +       devres_free(devm_state);
> +       return ERR_PTR(ret);

If PTR_ERR_OR_ZERO is used above as I suggested, ret may be 0 here.

Then it is probably clearer to add a check if (!ret) and return NULL
explicitly for that case, I think.

[...]

Kind regards
Uffe

