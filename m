Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C274632F3EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 20:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCETbD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 14:31:03 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:44717 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCETat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 14:30:49 -0500
Received: by mail-oo1-f51.google.com with SMTP id n19so689460ooj.11;
        Fri, 05 Mar 2021 11:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0zxLtovtFMmT2lNUt8ysKJIO/ypRqEiptzm/NiMSFQ=;
        b=AgiRzHJpIzRcXhdMgJICJXUYvQCqnwR9JsPZVcUaT7GqmtZysLmcaoqK/jIxcV3i4y
         bwhz0MVZOYAyINFDUwT9iJ0F82Ve4pBzyo6wxsrLOk2a202XDA+86wo8M9Tkky5wOnP7
         driMdHOKKQm1K0F9WKVW416eW/C68JMH1tf9fBFh4OIxj3AuikI/H0L/ymqQMc+s6uwA
         z/I6lViu+d4RfqWGJn+fNHe/A5r6koS0uQu1RNerzs65L8R3dhffQpcva1TOZoFkGYvm
         mI3wKVxcrqYjOPkcYo6yi+0HmLVGPKz4VCmTueWbzH1Q0v4sAFzFfyTMnD4hjfkL9t6s
         zF/A==
X-Gm-Message-State: AOAM530fynt9U4HsXaR5UxtVTJDFit0UjJkb6a4Z8QZQqTLmTdCtFcs7
        mKFXqfAqa6o75i6rnLRbwg==
X-Google-Smtp-Source: ABdhPJxJDrzt/TBa6fY+TozGvrzJCeACfv2dQy+Qq8U3kai7NfGEWdqFCDVsqBp1S/vleECBLSDpmA==
X-Received: by 2002:a4a:ac49:: with SMTP id q9mr8988525oon.73.1614972649122;
        Fri, 05 Mar 2021 11:30:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f29sm812537ots.22.2021.03.05.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 11:30:48 -0800 (PST)
Received: (nullmailer pid 516963 invoked by uid 1000);
        Fri, 05 Mar 2021 19:30:47 -0000
Date:   Fri, 5 Mar 2021 13:30:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH 1/7] dt_bindings: Add protection limit properties
Message-ID: <20210305193047.GA501479@robh.at.kernel.org>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
 <eacb8a0aad9190219b36763927602e9a566649c2.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eacb8a0aad9190219b36763927602e9a566649c2.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 11, 2021 at 02:34:17PM +0200, Matti Vaittinen wrote:
> Support specifying protection/error/warning limits for regulator
> over current, over temperature and over/under voltage.
> 
> Most of the PMICs support only "protection" feature but few
> setups do also support error/warning level indications.
> 
> On many ICs most of the protection limits can't actually be set.
> But for example the ampere limit for over-current protection on ROHM
> BD9576 can be configured - or feature can be completely disabled.
> 
> Provide limit setting for all protections/errors for the sake of
> the completeness and do that using own properties for all so that
> not all users would need to set all levels when only one or few are
> supported.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
> index 6d0bc9cd4040..47fff75f0554 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
> @@ -117,6 +117,88 @@ properties:
>      description: Enable over current protection.
>      type: boolean
>  
> +  regulator-over-current-protection-microamp:

Kind of long and 'current' is implied by 'microamp'. Perhaps 
regulator-oc-protection-microamp and similar.

> +    description: Set over current protection limit. This is a limit where
> +      hardware performs emergency shutdown. Zero can be passed to disable
> +      protection and value '1' indicates that protection should be enabled but
> +      limit setting can be omitted.
> +
> +  regulator-over-current-error-microamp:
> +    description: Set over current error limit. This is a limit where part of
> +      the hardware propably is malfunctional and damage prevention is requested.
> +      Zero can be passed to disable error detection and value '1' indicates
> +      that detection should be enabled but limit setting can be omitted.
> +
> +  regulator-over-current-warn-microamp:
> +    description: Set over current warning limit. This is a limit where hardware
> +      is assumed still to be functional but approaching limit where it gets
> +      damaged. Recovery actions should be initiated. Zero can be passed to
> +      disable detection and value '1' indicates that detection should
> +      be enabled but limit setting can be omitted.
> +
> +  regulator-over-voltage-protection-microvolt:
> +    description: Set over voltage protection limit. This is a limit where
> +      hardware performs emergency shutdown. Zero can be passed to disable
> +      protection and value '1' indicates that protection should be enabled but
> +      limit setting can be omitted. Limit is given as microvolt offset from
> +      voltage set to regulator.
> +
> +  regulator-over-voltage-error-microvolt:
> +    description: Set over voltage error limit. This is a limit where part of
> +      the hardware propably is malfunctional and damage prevention is requested
> +      Zero can be passed to disable error detection and value '1' indicates
> +      that detection should be enabled but limit setting can be omitted. Limit
> +      is given as microvolt offset from voltage set to regulator.
> +
> +  regulator-over-voltage-warn-microvolt:
> +    description: Set over voltage warning limit. This is a limit where hardware
> +      is assumed still to be functional but approaching limit where it gets
> +      damaged. Recovery actions should be initiated. Zero can be passed to
> +      disable detection and value '1' indicates that detection should
> +      be enabled but limit setting can be omitted. Limit is given as microvolt
> +      offset from voltage set to regulator.
> +
> +  regulator-under-voltage-protection-microvolt:
> +    description: Set over under voltage protection limit. This is a limit where
> +      hardware performs emergency shutdown. Zero can be passed to disable
> +      protection and value '1' indicates that protection should be enabled but
> +      limit setting can be omitted. Limit is given as microvolt offset from
> +      voltage set to regulator.
> +
> +  regulator-under-voltage-error-microvolt:
> +    description: Set under voltage error limit. This is a limit where part of
> +      the hardware propably is malfunctional and damage prevention is requested
> +      Zero can be passed to disable error detection and value '1' indicates
> +      that detection should be enabled but limit setting can be omitted. Limit
> +      is given as microvolt offset from voltage set to regulator.
> +
> +  regulator-under-voltage-warn-microvolt:
> +    description: Set over under voltage warning limit. This is a limit where
> +      hardware is assumed still to be functional but approaching limit where
> +      it gets damaged. Recovery actions should be initiated. Zero can be passed
> +      to disable detection and value '1' indicates that detection should
> +      be enabled but limit setting can be omitted. Limit is given as microvolt
> +      offset from voltage set to regulator.
> +
> +  regulator-over-temperature-protection-kelvin:
> +    description: Set over temperature protection limit. This is a limit where
> +      hardware performs emergency shutdown. Zero can be passed to disable
> +      protection and value '1' indicates that protection should be enabled but
> +      limit setting can be omitted.
> +
> +  regulator-over-temperature-error-kelvin:
> +    description: Set over temperature error limit. This is a limit where part of
> +      the hardware propably is malfunctional and damage prevention is requested
> +      Zero can be passed to disable error detection and value '1' indicates
> +      that detection should be enabled but limit setting can be omitted.
> +
> +  regulator-over-temperature-warn-kelvin:
> +    description: Set over temperature warning limit. This is a limit where
> +      hardware is assumed still to be functional but approaching limit where it
> +      gets damaged. Recovery actions should be initiated. Zero can be passed to
> +      disable detection and value '1' indicates that detection should
> +      be enabled but limit setting can be omitted.
> +
>    regulator-active-discharge:
>      description: |
>        tristate, enable/disable active discharge of regulators. The values are:
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
