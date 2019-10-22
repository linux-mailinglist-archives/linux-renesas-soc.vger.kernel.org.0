Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69B2DFE9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 09:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfJVHuP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 03:50:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40287 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJVHuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 03:50:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id o28so16822919wro.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2019 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aGTgDJARvoP4kHQqngiG3qKhTgw4nOnbdZFyRj0gwxY=;
        b=a9255GgWNRcDwq8BNQhwwSHn6mA2ru5gSF0YJxo+5tkhM3FHcFU/yt9zfKzyZ4ZYAZ
         jw0NDPELuE4cNUaH777pJFKlPBKpHarVK3U2nC4yeiLaMq4V8ByVSIWW8KkSb5tZmS3r
         cktjjjx+02vqWRIwc1ymYYWlli/h1XI+te0XLzmeMCWs8PtbkbTfNv6dmH12uQ0tCMiE
         nbHDWPVA+Md05CAfhsi59QOvxEC2QynilaUQz0niJCIbR0dP4l5budbJsIn/7JSjN7nK
         VoQOcSDpD+j0TP1r5cjiSAfzQ+CMciGLuhZDCGepp6yp/80Cvev2Ytzz99138KCbwpb9
         ghoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aGTgDJARvoP4kHQqngiG3qKhTgw4nOnbdZFyRj0gwxY=;
        b=isoNd9tUQu7qgPkUFbenteI7jcqbuNka/TdJ3m6tf65S5YvoMmmW/HQRXyk4/1P6k3
         OuzduOnmXsgbtlG/J0SviUQEtZXfObsOi5er4cZgmFL+8AuD1q6YAtvJdrtW52dszh6Q
         pG1JPdlsEai3waE8XDMcX9F/1J8NzVv5Sow/qre3xwzJshzRFYk9CLURDTS0wEn/HQFL
         ouWjaNxDOuBcYENDis/Z8iC+W/5DSvpepyp2tg0kA+VzZr5FtvaWT91EpZbobrYXWBeh
         Khnob1I/Qf/PKA2J02W+WyU2/qa1OWYzFSpdtRcFHaf5WYluMZdGZyfhR1g5pmpiDwDe
         XcTg==
X-Gm-Message-State: APjAAAX3o34Gb35tcLvaTM4r0/V2c6rt9Ii1gjvvRpOjTKUQqqhSxUWb
        AnlLq5mG7/0KUK2zRbLMpkvX7Q==
X-Google-Smtp-Source: APXvYqzMUVSAWfDykfbGD1LdQbZJXPIuXVKfbeu8ExT4HIcx6vsuzjmMkwUzNonqAvo1KRiKYRVFjA==
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr2251871wrx.171.1571730611336;
        Tue, 22 Oct 2019 00:50:11 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z142sm17714116wmc.24.2019.10.22.00.50.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:50:10 -0700 (PDT)
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, CK Hu <ck.hu@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rongrong Zou <zourongrong@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Vincent Abriou <vincent.abriou@st.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <906c3ecc-89ed-43a9-f011-68b012bba81d@baylibre.com>
Date:   Tue, 22 Oct 2019 09:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021214550.1461-5-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/10/2019 23:45, Rob Herring wrote:
> Add support in CMA helpers to handle callers specifying
> DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
> change. drm_gem_cma_dumb_create() always creates a kernel mapping as
> before. drm_gem_cma_dumb_create_internal() lets the caller set the flags
> as desired. Therefore, update all the existing callers of
> drm_gem_cma_dumb_create_internal() to also set the
> DRM_MODE_DUMB_KERNEL_MAP flag.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c              |  1 +
>  drivers/gpu/drm/drm_gem_cma_helper.c          | 48 +++++++++++--------
>  drivers/gpu/drm/meson/meson_drv.c             |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  1 +
>  drivers/gpu/drm/stm/drv.c                     |  1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
>  8 files changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index d49772de93e0..7cf0dc4cbfc1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -31,6 +31,7 @@ static int komeda_gem_cma_dumb_create(struct drm_file *file,
>  	u32 pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  
>  	args->pitch = ALIGN(pitch, mdev->chip.bus_width);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 8a76315aaa0f..aeb1a779ecc1 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -465,6 +465,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
>  	u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
>  
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignment);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 4cebfe01e6ea..f91e9e8adeaf 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -78,21 +78,8 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
>  	return ERR_PTR(ret);
>  }
>  
> -/**
> - * drm_gem_cma_create - allocate an object with the given size
> - * @drm: DRM device
> - * @size: size of the object to allocate
> - *
> - * This function creates a CMA GEM object and allocates a contiguous chunk of
> - * memory as backing store. The backing memory has the writecombine attribute
> - * set.
> - *
> - * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> - * error code on failure.
> - */
> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> -					      size_t size)
> +static struct drm_gem_cma_object *
> +drm_gem_cma_create_flags(struct drm_device *drm, size_t size, u32 flags)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	int ret;
> @@ -103,6 +90,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  
> +	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
> +		cma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> +
>  	cma_obj->vaddr = dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
>  					 GFP_KERNEL | __GFP_NOWARN,
>  					 cma_obj->dma_attrs);
> @@ -119,6 +109,25 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	drm_gem_object_put_unlocked(&cma_obj->base);
>  	return ERR_PTR(ret);
>  }
> +
> +/**
> + * drm_gem_cma_create - allocate an object with the given size
> + * @drm: DRM device
> + * @size: size of the object to allocate
> + *
> + * This function creates a CMA GEM object and allocates a contiguous chunk of
> + * memory as backing store. The backing memory has the writecombine attribute
> + * set.
> + *
> + * Returns:
> + * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> + * error code on failure.
> + */
> +struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> +					      size_t size)
> +{
> +	return drm_gem_cma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>  
>  /**
> @@ -139,14 +148,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>   */
>  static struct drm_gem_cma_object *
>  drm_gem_cma_create_with_handle(struct drm_file *file_priv,
> -			       struct drm_device *drm, size_t size,
> +			       struct drm_device *drm, size_t size, u32 flags,
>  			       uint32_t *handle)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	struct drm_gem_object *gem_obj;
>  	int ret;
>  
> -	cma_obj = drm_gem_cma_create(drm, size);
> +	cma_obj = drm_gem_cma_create_flags(drm, size, flags);
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  
> @@ -225,7 +234,7 @@ int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
>  		args->size = args->pitch * args->height;
>  
>  	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
> @@ -256,9 +265,10 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
>  
>  	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	args->size = args->pitch * args->height;
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 397c33182f4f..1593518dcbe4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -81,6 +81,7 @@ static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	 */
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
>  	args->size = PAGE_ALIGN(args->pitch * args->height);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..c9b1f298ce7e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -299,6 +299,7 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  		align = 16 * args->bpp / 8;
>  
>  	args->pitch = roundup(min_pitch, align);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 7582d0e6a60a..f09b9a035376 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
>  	 * align to 64 bytes since Mali requires it.
>  	 */
>  	args->pitch = ALIGN(min_pitch, 64);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  	args->size = args->pitch * args->height;
>  
>  	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 5a9f9aca8bc2..0f76a4ac95b3 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -47,6 +47,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *file,
>  	 */
>  	args->pitch = roundup(min_pitch, 128);
>  	args->height = roundup(args->height, 4);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index a5757b11b730..f653a5d1e2d6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -34,6 +34,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *file_priv,
>  {
>  	/* The hardware only allows even pitches for YUV buffers. */
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 2);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # for drm_gem_cma_helper and meson drm driver
