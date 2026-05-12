Return-Path: <linux-renesas-soc+bounces-32450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMfYCkjTAmpJxwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:14:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AC351B941
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1458D30BE3E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32839379C39;
	Tue, 12 May 2026 07:07:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E04379C55
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569649; cv=none; b=W0UXEjv+U7LIIAgCJdDduQVEfXn/IyXosrLne4Ei3x2O2OXDtGwy6lVnima8LDErPyvKSkPvsPgNFEkLFUxGH1n2ivZslRvVRw7lnGDuXy+7nawJ787u+4dhE9SKe05DgstZ7JVxKtAasO7+VAgqqI7GxA46DJhmajmOrkpahxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569649; c=relaxed/simple;
	bh=QOuhUbECchN9O5z4tSuzAVzWrzBcGh/7OTIvurcyros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7NFbGv1PsTWytwwNN5D1PpddPioZGMdFxPWID2OCl+kE9Q9iPfInNPZB/GJQhL+ZFGvpK2djCuU0nGLA2KTQdYaDL8gDC2QaPdJOBpavIWx5UQOBHn/47PPNpEkXmJrtbCfPAhJkh6LwQ2ijq6NXg+GH/IJmmmkzgvL4Vp1+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751136c561so4301346e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 00:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569643; x=1779174443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=;
        b=LtngxVyEc7ICvRWDlkFvO56bF1v6Rn5qKyz9NQ6pzpHHp7wnzgzgX8LDOB1DQfmnUu
         +4XWRCw8LgBcCECBE2aGps+BWi2EiVJpm8+49JxsO34/o74lsvG8AgiPFTDilrVxc5Fp
         7jXyVDgd6EuQ6BniB2VpZOsB4G6PdYpnzWkA8Y6A/MDq9lmetRRAWmV7uC39K4gx57ex
         h7QpHoHwpMYuUysKK8JyzXNKsrEO2boYwYcL5MzboTg5y/OSurEIUx1+aXmmYjDS+nc3
         qmKc2NKSQ4C3E2fGqb2y7adq76oYH80MfzLxQLf7X0aOqo2ZTNKwlY7b1E6unLTb8DyD
         Pi5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+v+O8VunIjYhfyJQ8XlxOlvX4CWeFTwqcDBRPU0U5mI8dtxnDMbjzrPoERWWrSg5STndOAP7DM/EyklGYt4oQPyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9WoeNFKH2b9K1OfG0aEkZY+EstRmdHs4XsNL/42af/gkeDfZ
	+sj4fXc15+EOnsQ3/jqxJaDGopuqyyIhGpEeOhTzxfbPY1hJwCdz7XMrok8t0MTb
X-Gm-Gg: Acq92OHGW2RSAzX22yV4jOEmMI3H9fLHDIGntsIbROl4zFrOi4qHVsfcTdYFF0iiGoK
	q8hVycudB6KbVSbumdOK/7PqPOyZRTiwDp003FLgxgiEIJDTW3IPCysnMQpyoL+MqgRr0HFCXsX
	qJ79ZGvye3lGvbCsaxcEhSpOLkjOuvSahRLqAj8BcBGjh2oRmYTF57Y59SelO5P/riE5m6qe2Y7
	S2oWkGAi23Uz5uigESrCAQSLczoR6de/BhjxhNMaXrq9xl+ydRFSMqvfFD478YNjtm5NSXi7INJ
	3y09qhXTnrrrm04ety/JPWHRi7lM4sR8PzXvtafwlFYeDHICGGS3J0+tLH5EKSwY4ElBcPC/Gyu
	8crrHeK3gfdVb3IiW6tHegZuKwK1PaPwmeItfYLHp219BkJPTJSDpEGuDTyinIz77R8JWy/3ZmN
	jYLqtmf6tGGBhGIM/7+mr80bu+y+tyg0mS7Ifcm/wa0k4Fv/b2550BjPEkxRoR
X-Received: by 2002:a05:6122:3408:b0:56d:86dd:d1b0 with SMTP id 71dfb90a1353d-575cf8ccd6amr1300092e0c.0.1778569643134;
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996d3esm8891218e0c.6.2026.05.12.00.07.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63201e0d6b8so1893783137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/thyIT6mnZVSsGy/lVPlXrOwsEErwo/TijZTwq2QsemKKVVewQXxV4RqpbJujuEQpyJ2CNCpp0PTmlgSbgMmHajg==@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:631:5717:5248 with SMTP id
 ada2fe7eead31-635d27ded2cmr1082007137.21.1778569642797; Tue, 12 May 2026
 00:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-5-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
X-Gm-Features: AVHnY4IHIx-N6TjHjhDj_v4IyNJlawKxUXPhLNy1xplrNwtoo77SAjjbsdZbWCo
Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] remoteproc: switch drivers to optional resource-table helper
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 71AC351B941
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,foss.st.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,amd.com];
	TAGGED_FROM(0.00)[bounces-32450-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,amd.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that currently ignore a missing table. This keeps the missing
> resource-table case non-fatal while letting other parsing failures
> propagate to the caller.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

>  drivers/remoteproc/rcar_rproc.c         | 13 +----------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

