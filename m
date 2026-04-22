Return-Path: <linux-renesas-soc+bounces-31484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMgEi1y6GkSKgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:01:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB732442B0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0586E3017F96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 06:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6A727EFEE;
	Wed, 22 Apr 2026 06:57:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E71E5201
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 06:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841037; cv=none; b=cyvHC62LV9pZHbgBrhay7revdBaVpSxrmBOezkL7DPx0rMcLhcIRBzSJuxGHlOXk/cdApzegAsBXUijEuyW6jvXWIxBV95cqP45UW/EP0b9lKru/8wCtAK0aS7ycKYx+1xF9WYPqiDn1/qFOjHudVHTAP7P5PUY6YKNge/rmoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841037; c=relaxed/simple;
	bh=wpkRjIorbMJMpqwzpLdjkd4Y24lBbCPn4ze08bDnJqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OenSWxk3WB+tV51S5ZfORyJVO7HFCosln+ttIQgQtANQNbkukdmqvgq++e2bVa8E5GxT7HOf2Y96yJjzVmEStDlrdWHZeT1d1rfuLP/ScPRN7s6hKQ3oaIkgxhAOOpFD/WQMwokt6KFO+g3y7UJGAsD813pg0XHVK3jhqNQ5WrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6948ff6b006so1425781eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 23:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841035; x=1777445835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=;
        b=TOKvm+VIq3R7J+Ilw57uY2RHibR9y8zFL0DxsGupcXZNDb3C/ew9EBoxhIol2D99rO
         3tyhSNafJEDsUMrs/1OHzm8rb2lQJ5yLuSEIocKetNgQVkMmIjKa6C8yA3iN3h7JGHPI
         S6LdrrcaEE2gk0iqrbg+7fP7CFvRleCvYgNUlEmNFwG7sIahV8oABDCEg1SYHrqVQ2De
         S3s4x2R83ahX2Xrc840ktRO7LQMjw7lr/dVkXvdRnRnCSZczz+2TR3t016ibPTR6v6NW
         oPOPxcn1VEqmBNu7YuASeuWYnjMrJDkgyk9cIU5bpCijdgQ81623mCJ8uLy3FiZN+wKT
         NdHw==
X-Forwarded-Encrypted: i=1; AFNElJ90zVI2XuIrnZrmpIYEMHkE8VQMNCUMtnFL1VUSRsi6qnDnJWT5iNR/F+FSf74dga5t2gTq9i9rPZsRR2AGLsR/6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1Fj09u21Kht5xiDyO/hmln13oZAXvJQ73TnhAQMET3G+s777
	BdAGmU6WyR8Ru8m+TjEgcET00K2bmkN6n6JSb4myjsuFYMlsORlXtGsmlrce3tBXdsc=
X-Gm-Gg: AeBDievYP8j7r6bjMeCyV8ImgZIh6sXVbqARHiTGPTQgRMx2CZnIfjlD2Hluy0ZG6gg
	3pMRwtCxMOQtH5vjr1ntAyfTDdDERDKbhE2BzM2VeVK6U0sRqjzSpWhepGWRgc3DHzhgXshzgiE
	pjQ4kdCiP3s28EiP9+oVAoKwF7qOyPD6fF43opRnwjrBSm4oRUkhmG0jHPvpuoOnlgu4biJZXtN
	vBXYs2BjaDNuvWN2d+68TUG9MWyn+qSY5xXY7KJW/i+Xi3rs9VP8SChPRonb7KMSWDom8KbnCXc
	/bPBHEfP7hhDnExz4ZQkdMoU0McIrneR+N/ywkKE7qdvrCDoxENe3sJah3VuGx4gG6BAOeGE+sW
	CZC7VR5s+7phQ8fgfyNCT+jyvKD6YXnFA+T+rBhH1zHKGhudMx6WGh53yc4afrva1ecA2r1PHTi
	TIQhPSsjVFShIWXIH8jZSaVhlrUJpMyIiyFoSpqx/AN4LuCdWaWiVf/ilzaVAqOLFtzXWzc+U=
X-Received: by 2002:a05:6820:a01:b0:694:8f37:708a with SMTP id 006d021491bc7-6948f37803cmr5327995eaf.15.1776841034892;
        Tue, 21 Apr 2026 23:57:14 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42f090b1de9sm3283433fac.6.2026.04.21.23.57.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:57:14 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41708f6c3feso3304425fac.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 23:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+h1awjUQGRyCI/+qRsBAAEO8TCPNXFtLjfVuQ1T98ZGUmrPPFB9cD8kEcRCA6L8wz8qMP0RDQ85EMgSyh22UYKDQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0d:b0:60f:f543:232a with SMTP id
 ada2fe7eead31-616f4b50368mr11299488137.2.1776840661908; Tue, 21 Apr 2026
 23:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
X-Gm-Features: AQROBzBFb_WdSQXK0LqlocZWzf5masVqawoXkZ-ffV8evv9b39yVA9knMtYt5TM
Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-31484-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: BB732442B0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 at 20:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.
>
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.
>
> Add a public function to obtain base protocol information for the
> selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
> Generator and Module Controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
>         }
>  }
>
> +/**
> + * scmi_get_base_info() - Get SCMI base protocol information
> + *
> + * @of_node: pointer to a device node for an SCMI provider
> + * @version: pointer to write base protocol information
> + *
> + * Check if an SCMI device has been instantiated for the passed device node
> + * pointer, and, if found, return its base info.
> +

Missing asterisk, reported by the kernel test robot.

> + * Return: 0 on Success or -ENOENT.
> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

