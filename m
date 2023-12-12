Return-Path: <linux-renesas-soc+bounces-949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD280FB38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 00:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD93281F84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 23:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D66B6472B;
	Tue, 12 Dec 2023 23:19:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A1D10E5;
	Tue, 12 Dec 2023 15:18:52 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1fb9a22b4a7so3757260fac.3;
        Tue, 12 Dec 2023 15:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702423131; x=1703027931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHKqe7ViutMSv2g14fY3qwKFW8ZpKD1NFrzggi/tnqo=;
        b=Rs6ZEHPzKYicHTfKOSn51+TMXeo2OwxOlANZkAxhDGcriN5E8LOMFMhecVtDmdO38b
         mbSTIFxAgfXpwhCYnS6/lH4xlNltQJ7tWBWqmy/xpYnSSBCFBNCdYe06udT9LrmEmgbq
         CrjUX+7n/rd91TO7MOiRfbPQslfEgSwJSvBhRJFZXw/B9Of6s3r/5g/mxJGyiMVoI0BY
         b4U1jtlar/seSY9y3HzWZ02ock3fPiLSNE/PuU+8/URw2uCYtSK9VUdQE+/yMPhJxnk/
         qcoDYKHCoFwIZFAUXeepa5vgJDBv9nWcicj+UTSJMH4kebxAFWnqR3gh+i9vmvsXoolw
         V5Pg==
X-Gm-Message-State: AOJu0YwoZ193osSFHmO3Fkf3wrNFRb4a3qXgoB4LiliDfYaBmvLhZzui
	iofEw9CXWbnbo9/67VelbIG3dI25OA==
X-Google-Smtp-Source: AGHT+IFv4gOEOqOwk6rzvt7hf9wkUW77nPHYSBry06DTHS99AsV+CJZnvtS0m+eBpMGwZyA87+qzrg==
X-Received: by 2002:a05:6870:40ce:b0:1fb:75b:99ba with SMTP id l14-20020a05687040ce00b001fb075b99bamr8188435oal.105.1702423131578;
        Tue, 12 Dec 2023 15:18:51 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w5-20020a056830110500b006c619f17669sm2459200otq.74.2023.12.12.15.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:18:51 -0800 (PST)
Received: (nullmailer pid 3116408 invoked by uid 1000);
	Tue, 12 Dec 2023 23:18:50 -0000
Date: Tue, 12 Dec 2023 17:18:50 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: dt-validate crash on <foo>-gpio
Message-ID: <20231212231850.GA3076602-robh@kernel.org>
References: <CAMuHMdUqbbjRpkStD7JGQ0r9hfR-sgx23FKGDASofX87AzaEcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqbbjRpkStD7JGQ0r9hfR-sgx23FKGDASofX87AzaEcA@mail.gmail.com>

On Mon, Dec 11, 2023 at 01:59:43PM +0100, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> When running "make dtbs_check" on a DTB in the Renesas BSP, I ran into
> the following backtrace:
> 
>     Traceback (most recent call last):
>       File "dt-validate", line 8, in <module>
>         sys.exit(main())
>       File "dt-schema/dtschema/dtb_validate.py", line 144, in main
>         sg.check_dtb(filename)
>       File "dt-schema/dtschema/dtb_validate.py", line 87, in check_dtb
>         dt = self.validator.decode_dtb(f.read())
>       File "dt-schema/dtschema/validator.py", line 491, in decode_dtb
>         return [dtschema.dtb.fdt_unflatten(self, dtb)]
>       File "dt-schema/dtschema/dtb.py", line 483, in fdt_unflatten
>         fixup_gpios(dt)
>       File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
>         fixup_gpios(v)
>       File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
>         fixup_gpios(v)
>       File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
>         fixup_gpios(v)
>       File "dt-schema/dtschema/dtb.py", line 378, in fixup_gpios
>         val = v[0]
>     TypeError: 'bool' object is not subscriptable
> 
> Turns out the issue is triggered by the presence of a (non-documented)
> boolean "no-use-gpio" property.
> 
> Apparently anything that matches "*-gpio" is treated as having a list of
> GPIO specifiers, causing a crash if that does not turn out to be true...
> While the introduction of a "no-use-gpio" boolean property might not
> survive public review, it would be good if the tooling wouldn't crash
> on it.

Seems like good discouragement on using unreviewed properties. ;) I'll 
make a fix.

In the future, use anything but devicetree@vger for this kind of issue. 
GH issue, devicetree-spec@vger, IRC are easier for me to see.

Rob

