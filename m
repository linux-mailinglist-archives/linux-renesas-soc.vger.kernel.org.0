Return-Path: <linux-renesas-soc+bounces-34737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O/UzKC5tS2rNRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 10:54:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425970E519
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 10:54:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC7F304BD9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 08:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7593D88F5;
	Mon,  6 Jul 2026 08:15:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B93AE187
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 08:14:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325699; cv=none; b=bEPpa541K2vti/+tXpNbUUbqvMa6tjRIYeqSM9K2lQ7tc9C7MZR4sNR7r7vaNrAFcWWjgRf16EZpOVFfltZjUB74cBRsVL4awJZWvGnncmA3tfgyXXlEwewvKjTjWVXYilqiCo20LW4qOMQezr+3tQmU0prN+GLUJRXrAivpTrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325699; c=relaxed/simple;
	bh=glp/HdZjPID3k9JwT/K76pg9j++zO7I3Rw77qWLA6Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvLle2Ob80GR+Gof3xDSIbnVS+i2Oof+8NMIS3cE4d1uy+TimZ/XHoaNsIrxB5AzBciOP0t0e8zUJxsXEUnJ/72yMwnDBklPnYpkWwlJFWKkoJFPGKpaRDsD+PtfgtZuQImOdv22y89Mb2J7oLKFswxy5uhzb0SMoK59GRXZs5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.41
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44cd990a94dso1794206fac.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325688; x=1783930488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf9yz7bHOmjN0sKgSDCZJBffOCMRQyGOU+wzNPd/KAs=;
        b=Au9cWhmx3gp+7+qZt2s6fQqA2c9hvXXvk1EayfOYALGS8NTd/BAGaF6SwuYVmfvyq1
         fQIns2ga7h3KJdUJ+AtVtBreZEZoJaKhtiaerOGuZnAKtv7BrbZY5LKeMJOEUkuXr6XF
         4ksXiU7N1IWDS1VtXAGg6G2QNvaVTV/159x5DxK23LzsUshJbV18IUXHw9zhkdQqVvs6
         4AllhCKsVlbY+/WijEC51nwGmLovXseCAYFlvSRD5yGHUD/BrMnZFyp8u7kOYsgEIe8l
         xhqNOwmza12HoS4l8CAfQqTYTdOtrI7N5JpDRgXoG9/4bj6DwqXEZEOJjURHTfuPWzJ2
         nryA==
X-Forwarded-Encrypted: i=1; AHgh+Rq59N1t5BegS3UnT/ENKsiuV6cKSSCkdukG7lY0l5+gkvosHlsD7gFVJJVUXZoinr1dxOENvE7HmwgLrM2E0Z2Lww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0ONEYTX//IaMvzOL1OTeFWwzGl0CuXdfMFBRZCqFLWRYju25
	fc9klMFmF8CqbCiZCoO5nHz9wwvmZT0w3FMtKYdQfsSZAuS3WUeix3qEm2j2OCeu
X-Gm-Gg: AfdE7cmWvc2j13X3hx5b9fdlTND2x+Rtebpv27E0YPml8GHNqOPxgdyqX5FLimyHa+L
	aI8tvmNUTo+/tNUO+AQ1z4eTl0gQYtA7Gqo4viKmWdd+wdczfZ8mZJ1n80MFP0LZ0Q/TwYyzhup
	5QbrrqeWDgXygH7iTNzTA1uPO3wB9ehtRAUkbal48w8VHgVmtX7UtqgfRb+kkgOCKdG6t44118N
	5aOF83xMpIDAxBBbfHHTfL6H7A5O+ktDbH9LnrdbYo2TffA0UqkgPNTJobIv3TvDBAwNv3GufwB
	KIoS1eJbyGipPO7n5Sc6UPNAT+kco3ykkV4IoN4KIxAUCC9fn/CtGjxPHQcTaILQ5X8I3ZMjdI7
	fFwpF3JECc2Rlf+v8T4PXzaLcVt/bEJG3dxUZfXqNfp5I1S4pJeZ0WELWujcS8VpKSbAI2SsbKV
	WvpQBvWcEV+Td65Co5l4SGWCRWTR5CRl3Kp07Dn9ffRb2N5RbdQQ==
X-Received: by 2002:a05:6870:a0aa:b0:448:6ba8:be6f with SMTP id 586e51a60fabf-44d1813dd5dmr5702714fac.19.1783325687728;
        Mon, 06 Jul 2026 01:14:47 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb5fa20fsm9013979fac.16.2026.07.06.01.14.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:14:47 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a18eab71bfso1473600eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sHGYUPBnK0Hm07zacGXYuMwX5TYaUL0Ku4tnSYd25C/e4oOh3fuqrSuNcIfpsfwFq0c6K3m7R+IMTbiRnTGHy4w==@vger.kernel.org
X-Received: by 2002:a05:6102:32cd:b0:73a:2195:4386 with SMTP id
 ada2fe7eead31-7427f05af6fmr3257389137.24.1783325349869; Mon, 06 Jul 2026
 01:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com> <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:08:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
X-Gm-Features: AVVi8CeGulURzBLLfkjFzqZ7MqehawY40QKBoJDeR4KrDLoVwstpoZpBrt3N2ag
Message-ID: <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow hardcoding EDID
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34737-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,kernel.org,suse.de,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1425970E519

Hi Laurent,

On Sun, 5 Jul 2026 at 23:35, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> data over an I2C bus. The bus is also used to detect the presence of a
> connected monitor by trying to read the EDID data.
>
> Some devices where the VGA display is integrated in the device and
> always connected do not connect the DDC pins. Some development boards,
> such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
>
> To support those, add the ability to provide hardcoded EDID data in the
> device tree. This is mutually exclusive with specifying a DDC bus, and
> can only be done when the VGA display is guaranteed to be always
> connected.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> @@ -19,10 +19,25 @@ properties:
>      description: phandle link to the I2C controller used for DDC EDID probing
>      $ref: /schemas/types.yaml#/definitions/phandle
>
> +  edid:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      When the DDC signals are not wired to the connector, and the connected
> +      display is not removable, this property is used to supply a binary EDID
> +      blob for the display.
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing VGA signals
>
> +allOf:
> +  - if:
> +      required:
> +        - ddc-i2c-bus
> +    then:
> +      properties:
> +        edid: false
> +

What if the DDC signals are wired to the connector on the provider side,
but not on the consumer side?
A DT overlay describing the consumer device can add an edid property,
but it cannot delete the ddc-i2c-bus property in the base DTB.

>  required:
>    - compatible
>    - port

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

