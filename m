Return-Path: <linux-renesas-soc+bounces-388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690B7FD163
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 09:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F2A7282248
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFC212B61;
	Wed, 29 Nov 2023 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13520E1;
	Wed, 29 Nov 2023 00:50:28 -0800 (PST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AT8mw3e055241;
	Wed, 29 Nov 2023 16:48:58 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 29 Nov 2023 16:48:56 +0800
Date: Wed, 29 Nov 2023 16:48:56 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Guo Ren <guoren@kernel.org>
CC: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <dminus@andestech.com>,
        <evan@rivosinc.com>, <geert+renesas@glider.be>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterz@infradead.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <rdunlap@infradead.org>,
        <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <ZWb6-LEkyh5RRpcP@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
 <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 3AT8mw3e055241

Hi Guo Ren,

On Thu, Nov 23, 2023 at 05:14:30AM +0800, Guo Ren wrote:
> On Wed, Nov 22, 2023 at 8:17 PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Document the ISA string for T-Head performance monitor extension
> > which provides counter overflow interrupt mechanism.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v2 -> v3:
> >   - New patch
> > Changes v3 -> v4:
> >   - No change
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index c91ab0e46648..694efaea8fce 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -258,5 +258,11 @@ properties:
> >              in commit 2e5236 ("Ztso is now ratified.") of the
> >              riscv-isa-manual.
> >
> > +        - const: xtheadpmu
> > +          description:
> > +            The T-Head performance monitor extension for counter overflow. For more
> > +            details, see the chapter 12 in the Xuantie C906 user manual.
> > +            https://github.com/T-head-Semi/openc906/tree/main/doc
> > +
> >  additionalProperties: true
> >  ...
> > --
> > 2.34.1
> >
> Reviewed-by: Guo Ren <guoren@kernel.org>

Thanks for the review.
Would you share document about T-Head PMU?

Best regards,
Peter Lin

> -- 
> Best Regards
>  Guo Ren

