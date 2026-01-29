Return-Path: <linux-renesas-soc+bounces-27634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFw2FLiee2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:54:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD297B345A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF7E0301725F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A34D3559E3;
	Thu, 29 Jan 2026 17:53:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897DD3563C2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709233; cv=none; b=MN0UJtKG0Kbqc+DziALIHJhiP3VAWQFogbvrD5GuymLNi/nNsRyqv0LJ/OYdS7JNYMm5bSAtwk5fqwDRSWX7/VMV5MFzyZqnE7/u+Lx2L99vlbIqwdohPVH/QrnA/m8ixt5CV5lbnnJrmULjoDgSrm5+thbXF2RcXIDpundZyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709233; c=relaxed/simple;
	bh=BmaXlCZ6264fsqvXXrjSoDhWiC9g1X99D6Z7+wsR+aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdV60MOLJcN9pi4fWHaOp9sduGlymOOF7kUupNK9jMZAtf5TM+hqmIUWngzEoNAs/3IqOf7pMlBEscOuvEx3hk3G4IWYeMBBKfYcFKVwJfjRRl37EiLtUt+QK7k+1VGAy4SV3Fdhs/jZu4tIrWmdqwelyPgMP07ZvbMLhNkh034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-662fc35291eso685153eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769709229; x=1770314029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/B1720oxlP4NMLZCxNr6vg90MXZvyAsBr77z/rjaXw=;
        b=tJkrSIlUJBsug+X+BfkDiMNrryl0hNXDZWUCxOgUCgS/GSprNn37FRAfAHfmgAZqEh
         dbV++yNjC31nKpwYbevHQa4oh36GlpxCnNuKq8GAAS/PY9+Wwoc8bTfL1SKWvdnvTdoS
         itUucl5vqntcXiVv+QDi+rEevKlyTStMCcVhftW3A6+X0WsgYGva/8hWUQPbfNzwpTKU
         XcP732+hI1DjK6elgdrg6dL7IFERhUXPYCKcqMXpQBlNQA3hCSfSKVZAx78wn9CiTvLs
         uDHqJJgXj2MzjedhgdSaoa7NYGqqX0Ft3RroaINorAbeW+iJoV+67cEhXBEO6jlFJ555
         y3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX9qcJ+2xUs81UPCFtRehk8gsJTBljNtf3LhLjOVXc5bTUiW5+Pj66or0idF1YEd10X6PvCsnalZjR6gdW1U4q0+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6YaiFRJk7Ogvfwpn3Tpyy/FrGI66v/eDF6zSGskC5EuY6SyMn
	fY7wrxcYmGDdPmkf/cc5IabvCGNz4E/LsPr7XWwolqPgk8jhS+jB2qQaAF+HVWn0
X-Gm-Gg: AZuq6aL3gQcGLwiLMPFFk4ZLvHAyqlRT1T6XvUvzrXBOOP4HcduorpWCFHjEPvXWbLO
	w1s39r/6wqFyb18beWkrBg2NDE3FcaAq7kvRKMCzUPF9hOZyfFFvb3R/Ju3vXIVkAMcPc/4VCfR
	mP97jsxASBtUzkRQ/C4wPPLJBieoDbjUUF/lMk5PAONAxz34KuWhIHu3G3O/N5MbRxT+/3nvKNg
	G9g7UGG0y77QoPK9GoXBwHGdcq2BaeFsAI9hP/WOaDxmn3xBqc9cQ1QeS2PMS55bXUhjVe6OtPm
	vOLn2tn1728vCj7F4RarsPm/HDoUTxOSnJ9Pt5xZq2eVSbupbeUvtkT5NKZSv6vOw/TnGVZ4GK1
	hYvkGpFAjgrwlDMwh/ZQCO/t+rBRsvjv/VmGjcDON2r2EMlTJ+/Mik/L+yXvoqr+uz0Miq7xagV
	i0A9wpoHh6LvBSY5dzDBTMEIJn96DTPwI58iFZskco/QERdZInNQOtmV9Jz0XAsXg=
X-Received: by 2002:a05:6122:3103:b0:566:24fc:94f2 with SMTP id 71dfb90a1353d-566a003739emr15999e0c.9.1769703583475;
        Thu, 29 Jan 2026 08:19:43 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685d07b42sm1282905e0c.18.2026.01.29.08.19.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:19:43 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-566360cab02so739389e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 08:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkYHj+5K+oKYoBkxq/tSQ+YJGlNnmjHsZ95QDLMY+GDd+ssboAqIdBeJFEJB+IvsDujdXyi4K98QJefwXyjd1Rrw==@vger.kernel.org
X-Received: by 2002:a05:6102:32d2:b0:5f1:50d0:3797 with SMTP id
 ada2fe7eead31-5f723937ba5mr3352368137.43.1769703201568; Thu, 29 Jan 2026
 08:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rz-sdio-mux-v7-0-92ebb6da0df8@solid-run.com>
 <20260128-rz-sdio-mux-v7-2-92ebb6da0df8@solid-run.com> <CAPDyKFrBuL+747QUJJUejtcvjm0V7Lt=vHwjvcMdCt_h4=sFwg@mail.gmail.com>
In-Reply-To: <CAPDyKFrBuL+747QUJJUejtcvjm0V7Lt=vHwjvcMdCt_h4=sFwg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 17:13:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgLR9yeLa5JKNdAOtNEirJ8263bmn1zRNAnKnmf8F-Sg@mail.gmail.com>
X-Gm-Features: AZwV_Qhgryuc7jjty9iqHy9zUzs2cyLGoonPOo05F0vrabMAU0UMySZvEVLbN1w
Message-ID: <CAMuHMdXgLR9yeLa5JKNdAOtNEirJ8263bmn1zRNAnKnmf8F-Sg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] mux: Add helper functions for getting optional and
 selected mux-state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Josua Mayer <josua@solid-run.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[solid-run.com,pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-27634-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,solid-run.com:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CD297B345A
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 at 17:06, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Wed, 28 Jan 2026 at 15:46, Josua Mayer <josua@solid-run.com> wrote:
> >
> > In-tree phy-can-transceiver driver has already implemented a local
> > version of devm_mux_state_get_optional.
> >
> > The omap-i2c driver gets and selects an optional mux in its probe
> > function without using any helper.
> >
> > Add new helper functions covering both aforementioned use-cases:
> >
> > - mux_control_get_optional:
> >   Get a mux-control if specified in dt, return NULL otherwise.
> > - devm_mux_state_get_optional:
> >   Get a mux-state if specified in dt, return NULL otherwise.
> > - devm_mux_state_get_selected:
> >   Get and select a mux-state specified in dt, return error otherwise.
> > - devm_mux_state_get_optional_selected:
> >   Get and select a mux-state if specified in dt, return error or NULL.
> >
> > Existing mux_get helper function is changed to take an extra argument
> > indicating whether the mux is optional.
> > In this case no error is printed, and NULL returned in case of ENOENT.
> >
> > Calling code is adapted to handle NULL return case, and to pass optional
> > argument as required.
> >
> > To support automatic deselect for _selected helper, a new structure is
> > created storing an exit pointer similar to clock core which is called on
> > release.
> >
> > To facilitate code sharing between optional/mandatory/selected helpers,
> > a new internal helper function is added to handle quiet (optional) and
> > verbose (mandatory) errors, as well as storing the correct callback for
> > devm release: __devm_mux_state_get
> >
> > Due to this structure devm_mux_state_get_*_selected can no longer print
> > a useful error message when select fails. Instead callers should print
> > errors where needed.
> >
> > Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> > property presence check") noted that "mux_get() always prints an error
> > message in case of an error, including when the property is not present,
> > confusing the user."
> >
> > The first error message covers the case that a mux name is not matched
> > in dt. The second error message is based on of_parse_phandle_with_args
> > return value.
> >
> > In optional case no error is printed and NULL is returned.
> > This ensures that the new helper functions will not confuse the user
> > either.
> >
> > With the addition of optional helper functions it became clear that
> > drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
> > Add stubs for all symbols exported by mux core.
> >
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> > ---
> >  drivers/mux/core.c           | 178 ++++++++++++++++++++++++++++++++++++-------
> >  include/linux/mux/consumer.h | 108 +++++++++++++++++++++++++-
> >  2 files changed, 253 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> > index a3840fe0995f..b01ec126caaf 100644
> > --- a/drivers/mux/core.c
> > +++ b/drivers/mux/core.c
>
> [...]
>
> >  static void devm_mux_state_release(struct device *dev, void *res)
> >  {
> > -       struct mux_state *mstate = *(struct mux_state **)res;
> > +       struct devm_mux_state_state *devm_state = res;
> >
> > -       mux_state_put(mstate);
> > +       if (devm_state->exit)
> > +               devm_state->exit(devm_state->mstate);
> > +
> > +       mux_state_put(devm_state->mstate);
> >  }
> >
> >  /**
> > - * devm_mux_state_get() - Get the mux-state for a device, with resource
> > - *                       management.
> > - * @dev: The device that needs a mux-control.
> > - * @mux_name: The name identifying the mux-control.
> > + * __devm_mux_state_get() - Get the optional mux-state for a device,
> > + *                         with resource management.
> > + * @dev: The device that needs a mux-state.
> > + * @mux_name: The name identifying the mux-state.
> > + * @optional: Whether to return NULL and silence errors when mux doesn't exist.
> > + * @init: Optional function pointer for mux-state object initialisation.
> > + * @exit: Optional function pointer for mux-state object cleanup on release.
> >   *
> >   * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
> >   */
> > -struct mux_state *devm_mux_state_get(struct device *dev,
> > -                                    const char *mux_name)
> > +static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
> > +                                             bool optional,
> > +                                             int (*init)(struct mux_state *mstate),
> > +                                             int (*exit)(struct mux_state *mstate))
> >  {
> > -       struct mux_state **ptr, *mstate;
> > +       struct devm_mux_state_state *devm_state;
> > +       struct mux_state *mstate;
> > +       int ret;
> >
> > -       ptr = devres_alloc(devm_mux_state_release, sizeof(*ptr), GFP_KERNEL);
> > -       if (!ptr)
> > +       devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
> > +       if (!devm_state)
> >                 return ERR_PTR(-ENOMEM);
> >
> > -       mstate = mux_state_get(dev, mux_name);
> > -       if (IS_ERR(mstate)) {
> > -               devres_free(ptr);
> > -               return mstate;
> > +       mstate = mux_state_get(dev, mux_name, optional);
> > +       if (IS_ERR_OR_NULL(mstate)) {
> > +               ret = PTR_ERR(mstate);
>
> Should this be PTR_ERR_OR_ZERO?

"mux_state_get() never returns NULL"
https://lore.kernel.org/202601221036.J0kR78Uw-lkp@intel.com

>
> > +               goto err_mux_state_get;
> >         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

