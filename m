Return-Path: <linux-renesas-soc+bounces-27851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IKNIKsQgmm9OwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 16:13:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15DDB26A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 16:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D839C3017FD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 15:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89BB30F817;
	Tue,  3 Feb 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpSyuDXo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571C30F804
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131107; cv=none; b=BZFtr7e1JOMJ/lvDzKLYz/YS+fqzulAgERwivXCxNdgtgbp3/LlugcXqJAN2njuqEAPZeMaE0E/JD4mUwE/HiS5pUSl0pIfUGa4LIf/K9OGXnryftryt0ku7P8zCRmsVT1RFTwvMidlAkvA+1P8oqYdm6t27/IksHgDPghho4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131107; c=relaxed/simple;
	bh=dwdID4DDF4GDX1SlmcA+3fzCA+ycXbc62Ld/klzXumU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLWSMQiI96JkxPqNQ3udtTkueHKwAlNv97HHVnKbEBoCidkF2Q15EUQrJVlTbUCzxdXBYVXgNAFm2Red8T1Y/8S/iws9zo7a3t6EOEz8u0CPutITTv9GTGfH61K5asIFziQRABEw802z9bdC2yY2InHBI8qMCn+iOSPHdN/9s/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpSyuDXo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso9941729a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770131104; x=1770735904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PNsfQXg9zjxapzMuZRa/zLzG4m46Jh75ILxmkVsiiI=;
        b=QpSyuDXo4abof9JkO71XCU0L++sL4W1+wPJrJo7W48kuy7WOXHhZrQZj7eTlkvPt/r
         3EF48KIYISJTJf0dVDzcU03GLcWVwnutn/ZqKxcZWAIvyGfGJbH3OQmEC9zHKVx/3eIv
         1uTifqNKiZLo622FwwQET8TQ9CzNqaLQbpqlEcTxtTxdcXJpFnpeRmlk+U9QiLi9D9x4
         4SSHT3da5CfLVETraR88yINgZJ8QN233j/EuMTgUZme3bzkTwEAgE896M2Wge2tCYmS/
         9zB7LE7l7vP30fslwT/TUHL8yBp84Ub2EbiZOUWsX6FuvpJiKF3eF8Aavz8x1Ey8WR1o
         P/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770131104; x=1770735904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PNsfQXg9zjxapzMuZRa/zLzG4m46Jh75ILxmkVsiiI=;
        b=OAJUhOWR5Gv4qIq45w0hIKi/7bhJr+9nzJCCbSSyNfC9AlfwTnzB8eXmKk5zRocUT8
         IfENQ/xesjpzqfAfSBZ9VzG4SIZ1GOkbhEthVVdy94jU0LERAySYmxXNaOk7emgd844E
         AVQJyRdsNxGoz25oEAIf+UOY2HDsZ99gfkwKuMWmQ8IRa+3lp/oRqrao2S6PhWwOpelt
         7JchOMEZgYPd6EvK0ZYurwz1srhRSXVT96SYgS3pYTDHov/eyDo4LfdIuqFNcLkNNsvw
         aW8ODEwM4NxE92GN20mioYAy3URc/DvZlB7jB/rKwwXZWgyg/ZYtpA+/5S+CVioAhIEl
         dc0w==
X-Forwarded-Encrypted: i=1; AJvYcCWewYR4NhGHfbEmNrF3EAO8TauJCATyLs5npWVl94Ou9b53IFciPnfLJOYNRpWCTZ38d1VjEp7MuoOHnx5pxc1x6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxosA9LQNdniNGup5JxgV1s07l0mNyFn8BlWki35KDcANGD0gK2
	w23AY0ITINXl130y3k5n8TmkH/7U50qwUjk5ZC6CqHixzd+a17Ex/JlD9BshDpn9F1Q=
X-Gm-Gg: AZuq6aKRiGUN1FZ6+GL+uFXNmM8iEw/0HoDVNVMA60o2t41jE7lXHdVtJ/J5qU8SPqV
	3B4holc2ookSywFLMDRiKCDCLFqWLZgPcTbMtX/28UIaOrHfmHztpb5zbnxQAoWeE3FF8wgsB6P
	maG4zFVctY7SXqBJrA8pCnhwNrua0PL+RKZ2yT8Cr6gxVi2lN70N+jlQWLFkbUuPKnZBINrj1IE
	0OLtgViqU9C9fM8nXA0lLWcfX0xqs9YgR1pxM6PP17kknxhVEdgnsN+smyq8+NTfus0zbNrCFR6
	RGqrAxfQSywL/m9XR88FyfMjdJTTufT2bq4aogfmsWA2US7hYrptPaxb0ewX/y3TpWfojcEBxx9
	fBBQFofrSODxV3C6RPfBKqJnN1IcJD/8BO3E//ImmPPfqRUwjOZn+Qq21afVGWB5Qx9dehwmKjJ
	sGridzkagWizUnAzfD
X-Received: by 2002:a17:907:96a8:b0:b87:65c5:602f with SMTP id a640c23a62f3a-b8dff7a30a8mr1000149366b.34.1770131104069;
        Tue, 03 Feb 2026 07:05:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6f8sm1049398466b.65.2026.02.03.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:05:03 -0800 (PST)
Date: Tue, 3 Feb 2026 18:05:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <aYIOnErmiSZ6wnP1@stanley.mountain>
References: <20260128-rz-sdio-mux-v7-0-92ebb6da0df8@solid-run.com>
 <20260128-rz-sdio-mux-v7-2-92ebb6da0df8@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-rz-sdio-mux-v7-2-92ebb6da0df8@solid-run.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27851-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: 9D15DDB26A
X-Rspamd-Action: no action

Sorry about that, I just looked at the implementation in linux-next and
didn't read the code from the patch too closely.

On Wed, Jan 28, 2026 at 04:46:10PM +0200, Josua Mayer wrote:
> +/**
> + * mux_control_get_optional() - Get the optional mux-control for a device.
> + * @dev: The device that needs a mux-control.
> + * @mux_name: The name identifying the mux-control.
> + *
> + * Return: A pointer to the mux-control, an ERR_PTR with a negative errno.

I wish the documentation for these "optional" said it could return NULL.

> + */
> +struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
> +{
> +	return mux_get(dev, mux_name, NULL, true);
> +}
> +EXPORT_SYMBOL_GPL(mux_control_get_optional);
> +

regards,
dan carpenter


