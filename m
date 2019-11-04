Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D002CEDB79
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 10:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfKDJRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 04:17:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42122 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKDJRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 04:17:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so16084739wrf.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Nov 2019 01:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=q9DI+wtDq20CWLWubYAFGKp3hI6e3yTRcViczcHbfn4=;
        b=mi/nokAupIqywno6tNX5+WHAnkxGUg9NCZlnHFKb5HFXIqZMDhgDQhPtHMZtcoHrdH
         Pcbn1zB6ZX/ucRcev4+stxClKKwl9vLPRbfhS4bUA1bI9jYXiyIcPXylLJPvF3JaTn6t
         lnlHDtcjD7rHwj7FITfUWYZwkgAxChI4q5dO1og/RAkxCY/hHidBGy1bqYKHVAEgR3zE
         8GI08sWOx5HgnktgFvk4Kia27/OX11kawdrGpZKYk/YtnOWyycBbEP1vgNO93s40pXjn
         H7S7C/JBLqW9ILt7j+ohkEbPwTf4deT72FyKaJOKs0Rxswr88fbfxwLiOAGDcWlgVvO7
         DLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=q9DI+wtDq20CWLWubYAFGKp3hI6e3yTRcViczcHbfn4=;
        b=QPNzpT1eRxSs1zQ91RbLIjtSgu1AphKskZg7SukAaw645vgUNutyxVmhSA/yDwB7E6
         pvxH/qGT0TkaIQH72YMsFTGUAKT+p5Kbk6D0QVzzBKQ8xhVvwCDMtHIm+gDtReskF+19
         BuwSQSdAityTEHE9nOzmaE1blMh3jRMn9qYmEoBxdhmalV3oRvtLMtwG6ZFZA1e/MDy9
         VlJANowpgFML2VapyoYi4ZmCGYSQ1diHjOL2Ir44BVzT1UXsYf1dZHS8yNlZDbii9GXU
         9AgPSCkFg2mdE82lDkSvN9iumkgUs/JPa4Gh+iKQqz9O5yeOi3UaSE5OBay14pYDpjlx
         XpDQ==
X-Gm-Message-State: APjAAAXpUqf7Y8hQ9I80pdthKW+hpydMdse08rZYx7Dn78QOB93iTwh8
        aG71SB4IoJ+TM+W4JACapYp1HA==
X-Google-Smtp-Source: APXvYqzSYcwwbRQ6FBkScrGu6DpO1BDAYQOnAj+4w/yVjWF6iswmCcL+ZkY0OQcX7R5ns4S3188Bng==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr20657084wrc.113.1572859033371;
        Mon, 04 Nov 2019 01:17:13 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p12sm17985658wrm.62.2019.11.04.01.17.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 01:17:12 -0800 (PST)
Subject: Re: [PATCH 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <255ad3bd-b2d9-7bd7-0592-5573e672da31@baylibre.com>
Date:   Mon, 4 Nov 2019 10:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572443014-17335-3-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,


On 30/10/2019 14:43, Fabrizio Castro wrote:
> In an effort to repurpose lvds-encoder.c to also serve the
> function of LVDS decoders, we ended up defining a new "generic"
> compatible string, therefore adapt the dt-bindings to fit the
> new purpose.

You should convert it to dt-schemas in this case.

Neil

> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  .../bindings/display/bridge/lvds-codec.txt         | 100 +++++++++++++++++++++
>  .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------------
>  2 files changed, 100 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt b/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
> new file mode 100644
> index 0000000..45fd81c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
> @@ -0,0 +1,100 @@
> +Trasnparent LVDS encoders and LVDS decoders
> +-------------------------------------------
> +
> +This binding supports transparent LVDS encoders and LVDS decoders that don't
> +require any configuration.
> +
> +LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> +incompatible data link layers have been used over time to transmit image data
> +to LVDS panels. This binding targets devices compatible with the following
> +specifications only.
> +
> +[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> +1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> +[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +Semiconductor
> +[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> +Electronics Standards Association (VESA)
> +
> +Those devices have been marketed under the FPD-Link and FlatLink brand names
> +among others.
> +
> +
> +Required properties:
> +
> +- compatible: Must be "lvds-encoder" for LVDS encoders or "lvds-decoder" for
> +              LVDS decoders.
> +
> +  Any encoder compatible with this generic binding, but with additional
> +  properties not listed here, must list a device specific compatible first
> +  followed by the generic compatible.
> +
> +Required nodes:
> +
> +This device has two video ports. Their connections are modeled using the OF
> +graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +
> +For LVDS encoders:
> +- Video port 0 for parallel input
> +- Video port 1 for LVDS output
> +
> +For LVDS decoders:
> +- Video port 0 for LVDS input
> +- Video port 1 for parallel output
> +
> +
> +LVDS encoder example
> +--------------------
> +
> +lvds-encoder {
> +	compatible = "lvds-encoder";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			lvds_enc_in: endpoint {
> +				remote-endpoint = <&display_out_rgb>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			lvds_enc_out: endpoint {
> +				remote-endpoint = <&lvds_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +LVDS decoder example
> +--------------------
> +
> +lvds-decoder {
> +	compatible = "lvds-decoder";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			lvds_dec_in: endpoint {
> +				remote-endpoint = <&display_out_lvds>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			lvds_dec_out: endpoint {
> +				remote-endpoint = <&rgb_panel_in>;
> +			};
> +		};
> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> deleted file mode 100644
> index 60091db..0000000
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Parallel to LVDS Encoder
> -------------------------
> -
> -This binding supports the parallel to LVDS encoders that don't require any
> -configuration.
> -
> -LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> -incompatible data link layers have been used over time to transmit image data
> -to LVDS panels. This binding targets devices compatible with the following
> -specifications only.
> -
> -[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> -1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> -[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> -Semiconductor
> -[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> -Electronics Standards Association (VESA)
> -
> -Those devices have been marketed under the FPD-Link and FlatLink brand names
> -among others.
> -
> -
> -Required properties:
> -
> -- compatible: Must be "lvds-encoder"
> -
> -  Any encoder compatible with this generic binding, but with additional
> -  properties not listed here, must list a device specific compatible first
> -  followed by this generic compatible.
> -
> -Required nodes:
> -
> -This device has two video ports. Their connections are modeled using the OF
> -graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
> -- Video port 0 for parallel input
> -- Video port 1 for LVDS output
> -
> -
> -Example
> --------
> -
> -lvds-encoder {
> -	compatible = "lvds-encoder";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			lvds_enc_in: endpoint {
> -				remote-endpoint = <&display_out_rgb>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			lvds_enc_out: endpoint {
> -				remote-endpoint = <&lvds_panel_in>;
> -			};
> -		};
> -	};
> -};
> 

