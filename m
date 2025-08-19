Return-Path: <linux-renesas-soc+bounces-20724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC52B2CAA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 19:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29C43AED6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 17:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789B82FFDF1;
	Tue, 19 Aug 2025 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR8zlb3+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4487C253934;
	Tue, 19 Aug 2025 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755624765; cv=none; b=Z+ieYk+uIZlQouKgfv64sUkHN48EeFoQSc7dvVVhD0BgX+wo/wlNaGpsyCeKFk2ANQqEO6krDCElC+vU8zL3txL/JU6STDkxAQA00i7Z8+sUllqcx1JL8Q1Kr8GVdqQb3YJ5EDoaxgmmtXFLfO1xfhdtBUFmdEPohJJXXXauGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755624765; c=relaxed/simple;
	bh=J6y6LuaznEwKZBwFRPm+m4Y8k2u/faVNHPijZP4is6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHCJQkR79BpQlOZSBfRteaZhX/jdbZFqmVG8i30p6IIAgBoD0iEbgW3VzEm7gzw9kPH5b28EVG/MoeW3gLwo5exg4JjSxojQRCbKQYVrgCPU2gn2xufgK2bCf4K7WSjxB9xn6T7pzyp4FzrQZ9jZcbWOTmb6q4iD50GzSkTTghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR8zlb3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C576EC116B1;
	Tue, 19 Aug 2025 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755624763;
	bh=J6y6LuaznEwKZBwFRPm+m4Y8k2u/faVNHPijZP4is6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dR8zlb3+YOIv0cuHGrDos071e5AJODOoPAJy/l7ZeqlUfVScMSh9LjxoYtVoAuDD0
	 xBY2B1XXEdDyDa2AuQcHb6aqVPIoI5+YA+qqtl1L1nuwVko4zyDBhhUr6uYe3+XKQz
	 KyLh0Dgo5bun2jnTfu2qwS6buxPNHounZ3WoPE6U6jET4rNaLZd5qKOIyKOTWxWL8K
	 HGzcNzPbYOiTYXfyLQDngFLQn4yvzxj1q3ZD7l1gozmu3XJ8ZutFm6GWNW9rbX1Xaa
	 t2ttS9bUXjnzFDU8VJS+6X4mwWFD+O8l8o8Dp+idkWxgqe6HPxFM0ORj/rSoRXy3jA
	 z7vVVpXEQY4Kw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ace3baso952138166b.3;
        Tue, 19 Aug 2025 10:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV610F+V6IXuY1o4+brgxkEQtUSkUj3j6qZKa8aay2oOTQFrMb/fUZbt08uBoONl0fmUH8fUs+YbPSrzk7E@vger.kernel.org, AJvYcCWHEKW0jAu6+0vuLEg//E9knIh5NfoksU57fcsqS3LZeGYZbfvgjuTSRzzrjxPYyUEpvvcXF7ddYmN+D3Jw@vger.kernel.org, AJvYcCWS1jcNZycB5A+FCwz+ezHPMxDeHs/epEs6ZyAPeFHyyz8U6eiatiRT3+M6DFlYH5F+J9bi287uxaJgpgyIe3862q0=@vger.kernel.org, AJvYcCXSabcQ197wILkEJpD6PWodJCAw6NiyXRHko4cU7HuZ62dF0YfkwOKtmbLvPwhcCwiznYgqLejK67jmYnxeAQg7gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24AFS99VET8Azh98jNvvhgJ/beCQwUXATDp/JCzzZwGT11F6C
	tmLFqa8xXkNNHSX1GmUIvegOrko1fqYraL9ETpMDSk0wNauDBWUiP5OZ1rTbgpK5rksvo26BOQB
	CxIxxOtfrhqBV+ctAWMNhjz+6Kp6cUw==
X-Google-Smtp-Source: AGHT+IEUi1cNispFJzaTig/zRP3yzP5O0TnRE9XfPCw/ckDcq03Jy+Mgc0TSd/4yPwlKVH5V12ZUjepBe+4MMFOi9Zs=
X-Received: by 2002:a17:907:7f0d:b0:afd:d993:9f2b with SMTP id
 a640c23a62f3a-afddd2351camr276179566b.65.1755624762291; Tue, 19 Aug 2025
 10:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org> <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
In-Reply-To: <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Aug 2025 12:32:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL41LWqXgwLg_wyjk_1m6PdYFp0n6kv_Grk5659F-va-g@mail.gmail.com>
X-Gm-Features: Ac12FXxo6YLchimNgboodm-rodCkxohoNe_mlbRUV7_mnTRcH8K4JAg2Z9LphQQ
Message-ID: <CAL_JsqL41LWqXgwLg_wyjk_1m6PdYFp0n6kv_Grk5659F-va-g@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 1:52=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Aug 13, 2025 at 04:48:03PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc=
.c
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v4:
> >  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> >
> > v3:
> >  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
> >  - Fix double increment of "i" in xlnx_r5
> >
> > v2:
> >  - Use strstarts instead of strcmp for resource names as they include
> >    the unit-address.
> >  - Drop the unit-address from resource name for imx and st drivers
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++--------
> >  drivers/remoteproc/imx_rproc.c            | 68 ++++++++------------
> >  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
> >  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
> >  drivers/remoteproc/qcom_q6v5_pas.c        | 75 +++++++++--------------
> >  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
> >  drivers/remoteproc/qcom_wcnss.c           | 23 +++----
> >  drivers/remoteproc/rcar_rproc.c           | 36 +++++------
> >  drivers/remoteproc/st_remoteproc.c        | 41 ++++++-------
> >  drivers/remoteproc/stm32_rproc.c          | 44 ++++++-------
> >  drivers/remoteproc/ti_k3_common.c         | 28 ++++-----
> >  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +-
> >  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 +-
> >  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++---------
> >  14 files changed, 204 insertions(+), 320 deletions(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/q=
com_q6v5_adsp.c
> > index 94af77baa7a1..a5b7cbb8fe07 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
> >
> >  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
> >  {
> > -     struct reserved_mem *rmem =3D NULL;
> > -     struct device_node *node;
> > -
> > -     node =3D of_parse_phandle(adsp->dev->of_node, "memory-region", 0)=
;
> > -     if (node)
> > -             rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > +     int ret;
> > +     struct resource res;
> >
> > -     if (!rmem) {
> > +     ret =3D of_reserved_mem_region_to_resource(adsp->dev->of_node, 0,=
 &res);
> > +     if (!ret) {
> >               dev_err(adsp->dev, "unable to resolve memory-region\n");
> > -             return -EINVAL;
> > +             return ret;
>
> This looks strange. Shouldn't it be `if (ret) {` ?

Indeed. I checked other spots for the same mistake and this is the only one=
.

>
> >       }
> >
> > -     adsp->mem_phys =3D adsp->mem_reloc =3D rmem->base;
> > -     adsp->mem_size =3D rmem->size;
> > -     adsp->mem_region =3D devm_ioremap_wc(adsp->dev,
> > -                             adsp->mem_phys, adsp->mem_size);
> > +     adsp->mem_phys =3D adsp->mem_reloc =3D res.start;
> > +     adsp->mem_size =3D resource_size(&res);
> > +     adsp->mem_region =3D devm_ioremap_resource_wc(adsp->dev, &res);
> >       if (!adsp->mem_region) {
> > -             dev_err(adsp->dev, "unable to map memory region: %pa+%zx\=
n",
> > -                     &rmem->base, adsp->mem_size);
> > +             dev_err(adsp->dev, "unable to map memory region: %pR\n", =
&res);
> >               return -EBUSY;
> >       }
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qc=
om_q6v5_mss.c
> > index 0c0199fb0e68..0fea5f91dd1c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
> >  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
> >  {
> >       struct device_node *child;
> > -     struct reserved_mem *rmem;
> > -     struct device_node *node;
> > +     struct resource res;
> > +     int ret;
> >
> >       /*
> >        * In the absence of mba/mpss sub-child, extract the mba and mpss
> > @@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5=
 *qproc)
> >        */
> >       child =3D of_get_child_by_name(qproc->dev->of_node, "mba");
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node,
> > -                                     "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 0, &res);
> >       } else {
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node) {
> > -             dev_err(qproc->dev, "no mba memory-region specified\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > -     if (!rmem) {
> > +     if (ret) {
> >               dev_err(qproc->dev, "unable to resolve mba region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     qproc->mba_phys =3D rmem->base;
> > -     qproc->mba_size =3D rmem->size;
> > +     qproc->mba_phys =3D res.start;
> > +     qproc->mba_size =3D resource_size(&res);
> >
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node,
> > -                                     "memory-region", 1);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 1, &res);
> >       } else {
> >               child =3D of_get_child_by_name(qproc->dev->of_node, "mpss=
");
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node) {
> > -             dev_err(qproc->dev, "no mpss memory-region specified\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > -     if (!rmem) {
> > +     if (ret) {
> >               dev_err(qproc->dev, "unable to resolve mpss region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     qproc->mpss_phys =3D qproc->mpss_reloc =3D rmem->base;
> > -     qproc->mpss_size =3D rmem->size;
> > +     qproc->mpss_phys =3D qproc->mpss_reloc =3D res.start;
> > +     qproc->mpss_size =3D resource_size(&res);
> >
> >       if (!child) {
> > -             node =3D of_parse_phandle(qproc->dev->of_node, "memory-re=
gion", 2);
> > +             ret =3D of_reserved_mem_region_to_resource(qproc->dev->of=
_node, 2, &res);
> >       } else {
> >               child =3D of_get_child_by_name(qproc->dev->of_node, "meta=
data");
> > -             node =3D of_parse_phandle(child, "memory-region", 0);
> > +             ret =3D of_reserved_mem_region_to_resource(child, 0, &res=
);
> >               of_node_put(child);
> >       }
> >
> > -     if (!node)
> > +     if (ret)
> >               return 0;
>
> Shouldn't we differentiate between an absent region (OK) and an error
> during parse.

IMO, no. The resource is either available to Linux or it isn't. The
driver can decide whether it can continue out without or not. Anything
more is just validation of the DT which the kernel does a terribly
inconsistent job of and we have better tools for.

> > -     rmem =3D of_reserved_mem_lookup(node);
> > -     if (!rmem) {
> > -             dev_err(qproc->dev, "unable to resolve metadata region\n"=
);
> > -             return -EINVAL;
> > -     }
> > -
> > -     qproc->mdata_phys =3D rmem->base;
> > -     qproc->mdata_size =3D rmem->size;
> > +     qproc->mdata_phys =3D res.start;
> > +     qproc->mdata_size =3D resource_size(&res);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qc=
om_q6v5_pas.c
> > index 02e29171cbbe..b3f7209289a6 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -121,7 +121,7 @@ struct qcom_pas {
> >
> >  static void qcom_pas_segment_dump(struct rproc *rproc,
> >                                 struct rproc_dump_segment *segment,
> > -                               void *dest, size_t offset, size_t size)
> > +                    void *dest, size_t offset, size_t size)
>
> Irrelevant? (and two next chunks)

Yes, not sure how those snuck in there.

Rob

